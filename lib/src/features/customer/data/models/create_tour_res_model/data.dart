import 'dart:convert';

import 'datum.dart';

class Data {
  Datum? datum;

  Data({this.datum});

  @override
  String toString() => 'Data(datum: $datum)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        datum: data['data'] == null
            ? null
            : Datum.fromMap(data['datum'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'datum': datum?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    Datum? datum,
  }) {
    return Data(
      datum: datum ?? this.datum,
    );
  }
}
