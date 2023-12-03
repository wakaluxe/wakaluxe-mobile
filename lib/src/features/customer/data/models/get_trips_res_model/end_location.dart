import 'dart:convert';

class EndLocation {
  EndLocation({this.coordinates, this.type});

  factory EndLocation.fromMap(Map<String, dynamic> data) => EndLocation(
        coordinates: List<double>.from(data['coordinates'] as List<dynamic>),
        type: data['type'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EndLocation].
  factory EndLocation.fromJson(String data) {
    return EndLocation.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  List<double>? coordinates;
  String? type;

  @override
  String toString() => 'EndLocation(coordinates: $coordinates, type: $type)';

  Map<String, dynamic> toMap() => {
        'coordinates': coordinates,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Converts [EndLocation] to a JSON string.
  String toJson() => json.encode(toMap());

  EndLocation copyWith({
    List<double>? coordinates,
    String? type,
  }) {
    return EndLocation(
      coordinates: coordinates ?? this.coordinates,
      type: type ?? this.type,
    );
  }
}
