import 'dart:convert';

import 'package:collection/collection.dart';

class EndLocation {
  const EndLocation({this.coordinates, this.address});

  factory EndLocation.fromMap(Map<String, dynamic> data) => EndLocation(
        coordinates: data['coordinates'] as List<double>?,
        address: data['address'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EndLocation].
  factory EndLocation.fromJson(String data) {
    return EndLocation.fromMap(json.decode(data) as Map<String, dynamic>, );
  }
  final List<double>? coordinates;
  final String? address;

  Map<String, dynamic> toMap() => {
        'coordinates': coordinates,
        'address': address ?? 'unnamed address',
      };

  /// `dart:convert`
  ///
  /// Converts [EndLocation] to a JSON string.
  String toJson() => json.encode(toMap());

  EndLocation copyWith({
    List<double>? coordinates,
  }) {
    return EndLocation(
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EndLocation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() => 'EndLocation(coordinates: $coordinates)';
}
