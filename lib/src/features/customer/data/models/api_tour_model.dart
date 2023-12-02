import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateTourApiResModel {
  final int durationValue;
  final int distanceValue;
  final String durationText;
  final String distanceText;
  final double? price;
  final String? destinationAddress;
  CreateTourApiResModel({
    required this.durationValue,
    required this.distanceValue,
    required this.distanceText,
    required this.durationText,
    required this.destinationAddress,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'duration': durationValue,
      'distance': distanceValue,
      'price': price,
      'destinationAddress': destinationAddress,

    };
  }

  factory CreateTourApiResModel.fromMap(Map<String, dynamic> map) {
    return CreateTourApiResModel(
      durationValue: map['duration'] as int,
      distanceValue: map['distance'] as int,
      price: map['price'] != null ? map['price'] as double : null,
      durationText: map['durationText'] as String,
      distanceText: map['distanceText'] as String,
      destinationAddress: map['destinationAddress'] as String,
    );
  }

  factory CreateTourApiResModel.init() {
    return CreateTourApiResModel(
      durationValue: 0,
      distanceValue: 0,
      price: 0,
      distanceText: '',
      destinationAddress: 'unnamed address',
      durationText: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTourApiResModel.fromJson(String source) =>
      CreateTourApiResModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  CreateTourApiResModel copyWith({
    int? duration,
    int? distance,
    double? price,
    String? durationText,
    String? distanceText,
    String? destinationAddress,
  }) {
    return CreateTourApiResModel(
      durationValue: duration ?? durationValue,
      distanceValue: distance ?? distanceValue,
      price: price ?? this.price,
      durationText: durationText ?? this.durationText,
      distanceText: distanceText ?? this.distanceText,
      destinationAddress: destinationAddress ?? this.destinationAddress,
    );
  }

  @override
  String toString() {
    return 'CreateTourApiResModel(durationValue: $durationValue, distanceValue: $distanceValue, durationText: $durationText, distanceText: $distanceText, price: $price, destinationAddress: $destinationAddress)';
  }
}
