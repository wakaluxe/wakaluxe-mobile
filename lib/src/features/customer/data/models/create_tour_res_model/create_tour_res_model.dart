import 'dart:convert';

import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/data.dart';

class CreateTourResModel {
  CreateTourResModel({this.status, this.data});

  factory CreateTourResModel.fromMap(Map<String, dynamic> data) {
    return CreateTourResModel(
      status: data['status'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  factory CreateTourResModel.empty() {
    return CreateTourResModel(
      status: null,
      data: null,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateTourResModel].
  factory CreateTourResModel.fromJson(String data) {
    return CreateTourResModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }
  String? status;
  Data? data;

  @override
  String toString() => 'CreateTourResModel(status: $status, data: $data)';

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [CreateTourResModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateTourResModel copyWith({
    String? status,
    Data? data,
  }) {
    return CreateTourResModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
