import 'dart:convert';

import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/end_location.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/start_location.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/user.dart';

class Datum {
  Datum({
    this.startLocation,
    this.endLocation,
    this.id,
    this.name,
    this.duration,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.price,
    this.user,
    this.status,
    this.paymentStatus,
    this.slug,
    this.completedOn,
    this.durationWeeks,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        startLocation: data['startLocation'] == null
            ? null
            : StartLocation.fromMap(
                data['startLocation'] as Map<String, dynamic>,
              ),
        endLocation: data['endLocation'] == null
            ? null
            : EndLocation.fromMap(data['endLocation'] as Map<String, dynamic>),
        id: data['_id'] as String?,
        name: data['name'] as String?,
        duration: data['duration'] as int?,
        ratingsAverage: (data['ratingsAverage'] as num?)?.toDouble(),
        ratingsQuantity: data['ratingsQuantity'] as int?,
        price: data['price'] as int?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        status: data['status'] as String?,
        paymentStatus: data['paymentStatus'] as String?,
        slug: data['slug'] as String?,
        completedOn: data['completedOn'] == null
            ? null
            : DateTime.parse(data['completedOn'] as String),
        durationWeeks: (data['durationWeeks'] as num?)?.toDouble(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  StartLocation? startLocation;
  EndLocation? endLocation;
  String? id;
  String? name;
  int? duration;
  double? ratingsAverage;
  int? ratingsQuantity;
  int? price;
  User? user;
  String? status;
  String? paymentStatus;
  String? slug;
  DateTime? completedOn;
  double? durationWeeks;

  @override
  String toString() {
    return 'Datum(startLocation: $startLocation, endLocation: $endLocation, id: $id, name: $name, duration: $duration, ratingsAverage: $ratingsAverage, ratingsQuantity: $ratingsQuantity, price: $price, user: $user, status: $status, paymentStatus: $paymentStatus, slug: $slug, completedOn: $completedOn, durationWeeks: $durationWeeks, id: $id)';
  }

  Map<String, dynamic> toMap() => {
        'startLocation': startLocation?.toMap(),
        'endLocation': endLocation?.toMap(),
        '_id': id,
        'name': name,
        'duration': duration,
        'ratingsAverage': ratingsAverage,
        'ratingsQuantity': ratingsQuantity,
        'price': price,
        'user': user?.toMap(),
        'status': status,
        'paymentStatus': paymentStatus,
        'slug': slug,
        'completedOn': completedOn?.toIso8601String(),
        'durationWeeks': durationWeeks,
      };

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    StartLocation? startLocation,
    EndLocation? endLocation,
    String? id,
    String? name,
    int? duration,
    double? ratingsAverage,
    int? ratingsQuantity,
    int? price,
    User? user,
    String? status,
    String? paymentStatus,
    String? slug,
    DateTime? completedOn,
    double? durationWeeks,
  }) {
    return Datum(
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      ratingsAverage: ratingsAverage ?? this.ratingsAverage,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      price: price ?? this.price,
      user: user ?? this.user,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      slug: slug ?? this.slug,
      completedOn: completedOn ?? this.completedOn,
      durationWeeks: durationWeeks ?? this.durationWeeks,
    );
  }
}
