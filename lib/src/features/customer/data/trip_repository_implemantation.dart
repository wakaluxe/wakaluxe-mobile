import 'package:wakaluxe/src/features/customer/data/data_sources/get_current_location.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class TripRepositoryImplementation implements TripRepository {
  @override
  Future<LocationEntity> getMyLocation() async {
    final data = await getCurrentLocation();
    return LocationEntity(
      longitude: data['longitude']!,
      latitude: data['latitude']!,
    );
  }
}
