// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationEntity {
  final double longitude;
  final double latitude;
  LocationEntity({
    required this.longitude,
    required this.latitude,
  });

  factory LocationEntity.init() => LocationEntity(longitude: 0, latitude: 0);
}
