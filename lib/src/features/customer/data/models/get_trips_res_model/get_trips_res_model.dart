import 'dart:convert';

import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/data.dart';

class GetTripsResModel {
  GetTripsResModel({this.status, this.results, this.data});
  factory GetTripsResModel.init() {
    return GetTripsResModel(
      status: '',
      results: 0,
      data: Data.init(),
    );
  }

  factory GetTripsResModel.fromMap(Map<String, dynamic> data) {
    return GetTripsResModel(
      status: data['status'] as String?,
      results: data['results'] as int?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetTripsResModel].
  factory GetTripsResModel.fromJson(String data) {
    return GetTripsResModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String? status;
  int? results;
  Data? data;

  @override
  String toString() {
    return 'GetTripsResModel(status: $status, results: $results, data: $data)';
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'results': results,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [GetTripsResModel] to a JSON string.
  String toJson() => json.encode(toMap());

  GetTripsResModel copyWith({
    String? status,
    int? results,
    Data? data,
  }) {
    return GetTripsResModel(
      status: status ?? this.status,
      results: results ?? this.results,
      data: data ?? this.data,
    );
  }
}
