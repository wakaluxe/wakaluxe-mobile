// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

class TripEntity {
  final String id;
  final String pickUp;
  final String destination;
  final TripState state;
  TripEntity({
    required this.id,
    required this.pickUp,
    required this.destination,
    required this.state,
  });

  TripEntity copyWith({
    String? id,
    String? pickUp,
    String? destination,
    TripState? state,
  }) {
    return TripEntity(
      id: id ?? this.id,
      pickUp: pickUp ?? this.pickUp,
      destination: destination ?? this.destination,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pickUp': pickUp,
      'destination': destination,
      'state': state.name,
    };
  }

  factory TripEntity.fromMap(Map<String, dynamic> map) {
    return TripEntity(
      id: map['id'] as String,
      pickUp: map['pickUp'] as String,
      destination: map['destination'] as String,
      state: TripState.values
          .firstWhere((element) => element.name == map['state'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory TripEntity.fromJson(String source) =>
      TripEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
