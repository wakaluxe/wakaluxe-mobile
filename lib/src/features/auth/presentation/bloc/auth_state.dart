// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class PhoneAuthError extends AuthState {
   final String error;

   const PhoneAuthError({required this.error});

   @override
   List<Object> get props => [error];
}

class PhoneAuthVerified extends AuthState {
  final UserEntity user;
  PhoneAuthVerified({
    required this.user,
  });
}

class PhoneAuthLoading extends AuthState {}
class loginWithCredentialnit extends AuthState {}
class PhoneAuthCodeSentSuccess extends AuthState {
   final String verificationId;
   const PhoneAuthCodeSentSuccess({
     required this.verificationId,
   });
   @override
   List<Object> get props => [verificationId];
}

class PhoneAuthCodeRetrievalTimeOut extends AuthState {}
