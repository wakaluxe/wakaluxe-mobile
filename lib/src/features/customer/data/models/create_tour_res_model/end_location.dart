import 'dart:convert';

class EndLocation {
  List<double>? coordinates;
  String? type;

  EndLocation({this.coordinates, this.type});

  @override
  String toString() => 'EndLocation(coordinates: $coordinates, type: $type)';

  factory EndLocation.fromMap(Map<String, dynamic> data) => EndLocation(
        coordinates: data['coordinates'] as List<double>?,
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'coordinates': coordinates,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EndLocation].
  factory EndLocation.fromJson(String data) {
    return EndLocation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

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
