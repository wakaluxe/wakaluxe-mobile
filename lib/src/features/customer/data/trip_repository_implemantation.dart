// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/get_current_location.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/get_tour_data.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/get_tour_price.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/services/call_driver_service.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/tour_backend_data_source.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/create_tour_req_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/end_location.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/start_location.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/data.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/datum.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/get_trips_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/end_location.dart'
    as Res;
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/start_location.dart'
    as Res;

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
  Future<void> callDriver({required String driverPhoneNumber}) async {
    try {
      final phoneNumber = driverPhoneNumber.replaceAll(' ', '');
      await callDriverService(phoneNumber);
    } catch (e) {
      logError('the error in call driver $e');
      throw Exception('Error calling driver: $e');
    }
  }

  @override
  Future<CreateTourResModel> createTour({
    required LocationEntity source,
    required LocationEntity destination,
    required String destinationAddress,
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
      final random = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final body = CreateTourReqModel(
        startLocation: StartLocation(
          coordinates: [source.longitude, source.latitude],
        ),
        endLocation: EndLocation(
          coordinates: [
            destination.longitude,
            destination.latitude,
          ],
          address: data.destinationAddress,
        ),
        name: '${destination.latitude} ${destination.longitude} $random',
        price: fullModel.price!.toInt(),
        duration: fullModel.durationValue,
      );
      logInfo('the body in create tour $body');
      /*  final result =
          await backendDataSource.createTour('Bearer $idToken', body);
      logInfo('createTour: $result'); */
      final result = CreateTourResModel.empty();
      return result.copyWith(
        data: Data(
          datum: Datum(
            id: '1',
            name: 'name',
            price: body.price,
            user: 'user',
            createdAt: DateTime.now(),
            duration: body.duration,
            durationWeeks: body.duration!.toDouble(),
            endLocation: Res.EndLocation(
              coordinates: body.endLocation!.coordinates,
            ),
            startLocation: Res.StartLocation(
              coordinates: body.startLocation!.coordinates,
            ),
          ),
        ),
        durationText: data.durationText,
        distanceText: data.distanceText,
        distanceValue: data.distanceValue,
      );
    } on DioException catch (e) {
      logError(
        'the error in create tour  ${e.response} and stack trace ${e.stackTrace}',
      );
      throw Exception(
        'Error getting trip api data: ${e.message} and stack trace ${e.stackTrace}',
      );
    } catch (e) {
      logError('the error in create tour $e');
      throw Exception('Error getting trip api data: $e');
    }
  }

  @override
  Future<void> cancelTour({required String tourId}) async {
    // TODO: implement cancelTour
    try {
      final idToken = await authData.getIdToken;
      await backendDataSource.cancelTour('Bearer $idToken', tourId);
    } on DioException catch (e) {
      logError(
        'the error in cancel tour  ${e.message} and stack trace ${e.stackTrace}',
      );
      throw Exception(
        'Error getting trip api data: ${e.message} ',
      );
    } catch (e) {
      logError('the error in cancel tour $e');
      throw Exception('Error getting trip api data: $e');
    }
  }

  @override
  Future<void> markTourAsComplete({required String tourId}) async {
    // TODO: implement markTourAsComplete
    try {
      final idToken = await authData.getIdToken;
      logInfo('the idToken in mark tour as complete $idToken');
      await backendDataSource.markTourAsComplete('Bearer $idToken', tourId);
    } on DioException catch (e) {
      logError(
        'the error in marking tour as complete ${e.message} and stack trace ${e.stackTrace}',
      );
      throw Exception(
        'Error getting trip api data: ${e.message} ',
      );
    } catch (e) {
      logError('the error in cancel tour $e');
      throw Exception('Error getting trip api data: $e');
    }
  }

  @override
  Future<GetTripsResModel> getTrips() {
    try {
      final idToken = authData.getIdToken;
      return backendDataSource.getTours('Bearer $idToken');
    } on DioException catch (e) {
      logError(
        'the error in get tour  ${e.message} and stack trace ${e.stackTrace}',
      );
      throw Exception(
        'Error getting trip api data: ${e.message} ',
      );
    } catch (e) {
      logError('The error in get tour $e');
      throw Exception('Error getting trip api data: $e');
    }
  }

  @override
  Future<void> reviewTrip({
    required String review,
    required double rating,
    required String tourId,
  }) {
    // TODO: implement reviewTrip
    throw UnimplementedError();
  }

  @override
  Future<void> startNavigation(
    LocationEntity source,
    LocationEntity destination,
    void Function() onArrival,
    void Function() onCancel,
  ) async {
    // TODO: implement startNavigation

    try {
      logInfo('the source in start navigation $source');
      logInfo('the destination in start navigation $destination');
      await MapBoxNavigation.instance.registerRouteEventListener((value) async {
        switch (value.eventType) {
          case MapBoxEvent.on_arrival:
          case MapBoxEvent.navigation_finished:
            await MapBoxNavigation.instance.finishNavigation();
            onArrival();

            break;
          case MapBoxEvent.navigation_cancelled:
            await MapBoxNavigation.instance.finishNavigation();
            onCancel();
            break;

          default:
            break;
        }
      });
      final sourcePoint = WayPoint(
        name: 'starting point',
        latitude: source.latitude,
        longitude: source.longitude,
      );
      final destinationPoint = WayPoint(
        name: 'destination',
        latitude: destination.latitude,
        longitude: destination.longitude,
      );

      final wayPoints = <WayPoint>[sourcePoint, destinationPoint];
      await MapBoxNavigation.instance.startNavigation(
        wayPoints: wayPoints,
      );
    } catch (e) {
      logError('The error in get tour $e');
      throw Exception('Error getting trip api data: $e');
    }
  }
}
