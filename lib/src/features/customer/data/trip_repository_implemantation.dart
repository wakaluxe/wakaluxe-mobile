// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/get_current_location.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/get_tour_data.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/get_tour_price.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/tour_backend_data_source.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/create_tour_req_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/end_location.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/start_location.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class TripRepositoryImplementation implements TripRepository {
  final TourBackendDataSource backendDataSource;
  final AuthRepositorymplementation authData;
  TripRepositoryImplementation({
    required this.backendDataSource,
    required this.authData,
  });
  @override
  Future<LocationEntity> getMyLocation() async {
    final data = await getCurrentLocation();
    return LocationEntity(
      longitude: data['longitude']!,
      latitude: data['latitude']!,
    );
  }

  @override
  Future<CreateTourResModel> createTour({
    required LocationEntity source,
    required LocationEntity destination,
  }) async {
    try {
      final data = await getTraveldData(
        start: source.toLatLng(),
        end: destination.toLatLng(),
      );
      logInfo('the data in create tour $data');
      final idToken = await authData.getIdToken;
      logInfo('the idToken in create tour $idToken');
      final fullModel = getTourPrice(data);
      logInfo('the fullModel in create tour $fullModel');
      final body = CreateTourReqModel(
        startLocation: StartLocation(
          coordinates: [source.longitude, source.latitude],
        ),
        endLocation: EndLocation(
          coordinates: [
            destination.longitude,
            destination.latitude,
          ],
        ),
        name: idToken,
        price:  fullModel.price!.toInt(),
        duration: fullModel.durationValue,
      );
      logInfo('the body in create tour $body');
      final result =
          await backendDataSource.createTour('Bearer $idToken', body).catchError((e) {
        logError('the error in create tour $e');
      });
      logInfo('createTour: $result');
      return result;
    } catch (e) {
      logError('the error in create tour $e');
      throw Exception('Error getting trip api data: $e');
    }
  }
}
