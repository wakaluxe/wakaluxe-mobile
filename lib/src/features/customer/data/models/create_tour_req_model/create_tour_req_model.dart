import 'dart:convert';

import 'package:collection/collection.dart';

import 'end_location.dart';
import 'start_location.dart';

class CreateTourReqModel {
  final StartLocation? startLocation;
  final EndLocation? endLocation;
  final String? name;
  final int? duration;
  final int? price;

  const CreateTourReqModel({
    this.startLocation,
    this.endLocation,
    this.name,
    this.duration,
    this.price,
  });

  factory CreateTourReqModel.fromMap(Map<String, dynamic> data) {
    return CreateTourReqModel(
      startLocation: data['startLocation'] == null
          ? null
          : StartLocation.fromMap(
              data['startLocation'] as Map<String, dynamic>),
      endLocation: data['endLocation'] == null
          ? null
          : EndLocation.fromMap(data['endLocation'] as Map<String, dynamic>),
      name: data['name'] as String?,
      duration: data['duration'] as int?,
      price: data['price'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'startLocation': startLocation?.toMap(),
        'endLocation': endLocation?.toMap(),
        'name': name,
        'duration': duration,
        'price': price,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateTourReqModel].
  factory CreateTourReqModel.fromJson(String data) {
    return CreateTourReqModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateTourReqModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateTourReqModel copyWith({
    StartLocation? startLocation,
    EndLocation? endLocation,
    String? name,
    int? duration,
    int? price,
  }) {
    return CreateTourReqModel(
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      price: price ?? this.price,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CreateTourReqModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      startLocation.hashCode ^
      endLocation.hashCode ^
      name.hashCode ^
      duration.hashCode ^
      price.hashCode;

  @override
  String toString() {
    return 'CreateTourReqModel(startLocation: $startLocation, endLocation: $endLocation, name: $name, duration: $duration, price: $price)';
  }
}
