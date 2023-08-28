part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SendOtpToPhoneEvent extends AuthEvent {

  const SendOtpToPhoneEvent({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class VerifySentOtpEvent extends AuthEvent {

  const VerifySentOtpEvent(
      {required this.otpCode, required this.verificationId,});
  final String otpCode;
  final String verificationId;

  @override
  List<Object> get props => [otpCode, verificationId];
}

class OnPhoneOtpSent extends AuthEvent {
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });
  final String verificationId;
  final int? token;

  @override
  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends AuthEvent {
  const OnPhoneAuthErrorEvent({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}

class OnPhoneAuthVerificationCompleteEvent extends AuthEvent {
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
  final AuthCredential credential;
}

class OnLogOutRequestEvent extends AuthEvent {}

class OnAppStartEvent extends AuthEvent {
}

