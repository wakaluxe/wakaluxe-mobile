import 'dart:convert';

import 'end_location.dart';
import 'start_location.dart';

class Datum {
  String? name;
  int? duration;
  double? ratingsAverage;
  int? ratingsQuantity;
  int? price;
  DateTime? createdAt;
  String? user;
  StartLocation? startLocation;
  EndLocation? endLocation;
  String? status;
  String? paymentStatus;
  String? id;
  String? slug;
  int? v;
  double? durationWeeks;

  Datum({
    this.name,
    this.duration,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.price,
    this.createdAt,
    this.user,
    this.startLocation,
    this.endLocation,
    this.status,
    this.paymentStatus,
    this.id,
    this.slug,
    this.v,
    this.durationWeeks,
  });

  @override
  String toString() {
    return 'Datum(name: $name, duration: $duration, ratingsAverage: $ratingsAverage, ratingsQuantity: $ratingsQuantity, price: $price, createdAt: $createdAt, user: $user, startLocation: $startLocation, endLocation: $endLocation, status: $status, paymentStatus: $paymentStatus, id: $id, slug: $slug, v: $v, durationWeeks: $durationWeeks, id: $id)';
  }

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        name: data['name'] as String?,
        duration: data['duration'] as int?,
        ratingsAverage: (data['ratingsAverage'] as num?)?.toDouble(),
        ratingsQuantity: data['ratingsQuantity'] as int?,
        price: data['price'] as int?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        user: data['user'] as String?,
        startLocation: data['startLocation'] == null
            ? null
            : StartLocation.fromMap(
                data['startLocation'] as Map<String, dynamic>),
        endLocation: data['endLocation'] == null
            ? null
            : EndLocation.fromMap(data['endLocation'] as Map<String, dynamic>),
        status: data['status'] as String?,
        paymentStatus: data['paymentStatus'] as String?,
        id: data['_id'] as String?,
        slug: data['slug'] as String?,
        v: data['__v'] as int?,
        durationWeeks: data['durationWeeks'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'duration': duration,
        'ratingsAverage': ratingsAverage,
        'ratingsQuantity': ratingsQuantity,
        'price': price,
        'createdAt': createdAt?.toIso8601String(),
        'user': user,
        'startLocation': startLocation?.toMap(),
        'endLocation': endLocation?.toMap(),
        'status': status,
        'paymentStatus': paymentStatus,
        '_id': id,
        'slug': slug,
        '__v': v,
        'durationWeeks': durationWeeks,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    String? name,
    int? duration,
    double? ratingsAverage,
    int? ratingsQuantity,
    int? price,
    DateTime? createdAt,
    String? user,
    StartLocation? startLocation,
    EndLocation? endLocation,
    String? status,
    String? paymentStatus,
    String? id,
    String? slug,
    int? v,
    double? durationWeeks,
  }) {
    return Datum(
      name: name ?? this.name,
      duration: duration ?? this.duration,
      ratingsAverage: ratingsAverage ?? this.ratingsAverage,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      user: user ?? this.user,
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      id: id ?? this.id,
      slug: slug ?? this.slug,
      v: v ?? this.v,
      durationWeeks: durationWeeks ?? this.durationWeeks,
    );
  }
}
