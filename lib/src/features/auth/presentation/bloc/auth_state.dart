// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState({
    this.user = UserEntity.empty,
  });

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

class AuthInitial extends AuthState {}

class PhoneAuthError extends AuthState {
  final String error;

  const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class PhoneAuthVerified extends AuthState {
  @override
  final UserEntity user;
  const PhoneAuthVerified({
    required this.user,
  }) : super(user: user);
}

class PhoneAuthLoading extends AuthState {}

class LoginWithCredentialnit extends AuthState {}

class PhoneAuthCodeSentSuccess extends AuthState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}

class PhoneAuthCodeRetrievalTimeOut extends AuthState {}

class AuthLogOutInit extends AuthState {}

class AuthLogOutSuccess extends AuthState {}

class AuthLogOutError extends AuthState {
  final String error;
  const AuthLogOutError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class AuthAppStartInit extends AuthState {}

class AuthAppStartSuccess extends AuthState {
  const AuthAppStartSuccess({
    super.user,
  });
}

class AuthAppStartError extends AuthState {
  final String error;
  const AuthAppStartError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class AuthChangeProfileImageInit extends AuthState {}

class AuthChangeProfileImageSuccess extends AuthState {
  final String imageUrl;
  const AuthChangeProfileImageSuccess({
    required this.imageUrl,
  });
  @override
  List<Object> get props => [imageUrl];
}

class AuthChangeProfileImageError extends AuthState {
  final String error;
  const AuthChangeProfileImageError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class AuthGetUserInit extends AuthState {}

class AuthGetUserSuccess extends AuthState {
  @override
  final UserEntity user;
  const AuthGetUserSuccess({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class AuthGetUserError extends AuthState {
  final String error;
  const AuthGetUserError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}