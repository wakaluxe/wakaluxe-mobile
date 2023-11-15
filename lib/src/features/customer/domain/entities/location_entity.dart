// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationEntity {
  final double longitude;
  final double latitude;
  LocationEntity({
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());
  LatLng toLatLng() => LatLng(latitude, longitude);
  factory LocationEntity.fromLatLng(LatLng latLng) =>
      LocationEntity(longitude: latLng.longitude, latitude: latLng.latitude);

  factory LocationEntity.init() => LocationEntity(longitude: 0, latitude: 0);
}
