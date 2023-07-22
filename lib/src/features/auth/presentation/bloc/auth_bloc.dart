import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/features/auth/data/firebase_auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_in_with_credential.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
      _onAppStart(event, emit);
      on<SendOtpToPhoneEvent>(_onSendOtp);
      on<VerifySentOtpEvent>(_onVerifyOtp);
      on<OnPhoneOtpSent>((event, emit) =>
          emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));
      on<OnPhoneAuthErrorEvent>(
          (event, emit) => emit(PhoneAuthError(error: event.error)));
      on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);
      on<OnLogOutRequestEvent>(_onLogOut);
    });
  }

  FutureOr<void> _onSendOtp(
      SendOtpToPhoneEvent event, Emitter<AuthState> emit) async {
    emit(PhoneAuthLoading());
    try {
      await authRepository.veryPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // On [verificationComplete], we will get the credential from the firebase  and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
          add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        },
        codeSent: (String verificationId, int? resendToken) {
          // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
          add(OnPhoneOtpSent(
              verificationId: verificationId, token: resendToken));
        },
        verificationFailed: (FirebaseAuthException e) {
          // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
          add(OnPhoneAuthErrorEvent(error: e.code));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(
            PhoneAuthCodeRetrievalTimeOut(),
          );
        },
      );
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifySentOtpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(PhoneAuthLoading());
      // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _loginWithCredential(
      OnPhoneAuthVerificationCompleteEvent event,
      Emitter<AuthState> emit) async {
    // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login
    try {
      emit(LoginWithCredentialnit());
      final result = await authRepository.signWithcredential(event.credential);
      result.fold((error) => emit(PhoneAuthError(error: error.message)),
          ((user) {
        //   if (user.user != null) {
        emit(PhoneAuthVerified(user: user));
        //  }
      }));
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthError(error: e.message ?? e.code));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _onLogOut(
      OnLogOutRequestEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLogOutInit());
      await authRepository.signOut();
      emit(AuthLogOutSuccess());
    } catch (e) {
      emit(AuthLogOutError(error: e.toString()));
    }
  }

  Future<void> _onAppStart(AuthEvent event, Emitter<AuthState> emit) async {
    try {
      logInfo('sign in anonymously');
      final user = authRepository.currentUser;

      if (!user.hasId) {
        await authRepository.signInAnonymously();
      }
    } catch (e) {}
  }
}
