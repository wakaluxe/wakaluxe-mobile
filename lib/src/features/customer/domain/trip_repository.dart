import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';

abstract class TripRepository {
  Future<LocationEntity> getMyLocation();
}
