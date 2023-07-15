import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String id;
  final String? fullName;
  final String? phoneNumber;
  final String? profilePicture;
  final String? token;
  const UserEntity({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    this.profilePicture,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'token': token,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as String,
      fullName: map['fullName'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      //TODO: fix this LATER
      profilePicture: null,
      token: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(Map<String, dynamic>.from(jsonDecode(source) as Map));

  UserEntity copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? profilePicture,
    String? token,
  }) {
    return UserEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      token: token ?? this.token,
    );
  }

  bool get hasToken => token != null && token!.isNotEmpty;
  bool get hasId => id.isNotEmpty;
  static const empty = UserEntity(
    id: '',
    fullName: '',
    phoneNumber: '',
  );
}
