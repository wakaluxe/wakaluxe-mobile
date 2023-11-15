import 'dart:convert';

import 'package:collection/collection.dart';

class StartLocation {
  final List<double>? coordinates;

  const StartLocation({this.coordinates});

  factory StartLocation.fromMap(Map<String, dynamic> data) => StartLocation(
        coordinates: data['coordinates'] as List<double>?,
      );

  Map<String, dynamic> toMap() => {
        'coordinates': coordinates,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StartLocation].
  factory StartLocation.fromJson(String data) {
    return StartLocation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StartLocation] to a JSON string.
  String toJson() => json.encode(toMap());

  StartLocation copyWith({
    List<double>? coordinates,
  }) {
    return StartLocation(
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! StartLocation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => coordinates.hashCode;
}
