import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/get_trips_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';

abstract class TripRepository {
  Future<LocationEntity> getMyLocation();
  Future<CreateTourResModel> createTour({
    required LocationEntity source,
    required LocationEntity destination,
    required String destinationAddress,
  });
  Future<void> cancelTour({required String tourId});
  Future<void> markTourAsComplete({required String tourId});
  Future<void> callDriver({required String driverPhoneNumber});
  Future<GetTripsResModel> getTrips();
  Future<void> reviewTrip({
    required String review,
    required double rating,
    required String tourId,
  });

  Future<void> startNavigation(
    LocationEntity source,
    LocationEntity destination,
    void Function() onArrival,
    void Function() onCancel,
  );
}
