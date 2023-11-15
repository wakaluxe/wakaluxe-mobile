// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, unknown }

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = UserEntity.empty,
  });

  final AppStatus status;
  final UserEntity user;

  const AppState.authenticated(UserEntity user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  bool get isAuthenticated => status == AppStatus.authenticated;

  @override
  List<Object> get props => [status, user];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toMap(),
      'user': user.toMap(),
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState._(
      status: AppStatusX.fromMap(map['status'] as String),
      user: UserEntity.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AppInitial extends AppState {
  const AppInitial() : super._(status: AppStatus.unknown);
}

extension AppStatusX on AppStatus {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AppStatus': toString(),
    };
  }

  static AppStatus fromMap(String status) {
    switch (status) {
      case 'authenticated':
        return AppStatus.authenticated;
      case 'unauthenticated':
        return AppStatus.unauthenticated;
      default:
        return AppStatus.unknown;
    }
  }
}
