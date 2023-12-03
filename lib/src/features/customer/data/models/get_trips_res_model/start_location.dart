import 'dart:convert';

class StartLocation {
  List<double>? coordinates;
  String? type;

  StartLocation({this.coordinates, this.type});

  @override
  String toString() {
    return 'StartLocation(coordinates: $coordinates, type: $type)';
  }

  factory StartLocation.fromMap(Map<String, dynamic> data) => StartLocation(
        coordinates: List<double>.from( data['coordinates'] as List<dynamic>),
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'coordinates': coordinates,
        'type': type,
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
    String? type,
  }) {
    return StartLocation(
      coordinates: coordinates ?? this.coordinates,
      type: type ?? this.type,
    );
  }
}
