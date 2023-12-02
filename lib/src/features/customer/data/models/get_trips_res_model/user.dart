import 'dart:convert';

class User {
  String? id;
  String? phoneNumber;

  User({this.id, this.phoneNumber});

  @override
  String toString() => 'User(id: $id, phoneNumber: $phoneNumber)';

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['_id'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'phoneNumber': phoneNumber,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    String? id,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
