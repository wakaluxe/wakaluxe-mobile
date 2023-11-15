import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';

abstract class TripRepository {
  Future<LocationEntity> getMyLocation();
  Future<CreateTourResModel> createTour({
    required LocationEntity source,
    required LocationEntity destination,
  });
}
