import 'dart:async';
import 'package:wakaluxe/src/features/customer/data/data_sources/tour_backend_data_source.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/create_tour_req_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/get_trips_res_model.dart';

class MockTourBackendDataSource implements TourBackendDataSource {
  @override
  Future<CreateTourResModel> createTour(
      String idToken, CreateTourReqModel body) {
    // TODO: return a Future of CreateTourResModel
    return Future.value(CreateTourResModel());
  }

  @override
  Future<void> markTourAsComplete(String idToken, String tourId) {
    // TODO: return a Future of void
    return Future.value();
  }

  @override
  Future<void> cancelTour(String idToken, String tourId) {
    // TODO: return a Future of void
    return Future.value();
  }

  @override
  Future<GetTripsResModel> getTours(String idToken) {
    // TODO: return a Future of GetTripsResModel
    return Future.value(GetTripsResModel());
  }

  @override
  Future<void> reviewTrip(
      String idToken, String tourId, Map<String, dynamic> body) {
    // TODO: return a Future of void
    return Future.value();
  }
}
