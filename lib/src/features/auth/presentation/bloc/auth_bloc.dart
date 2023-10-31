import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/auth_source_route.dart';

import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<OnAppStartEvent>(_onAppStart);
    on<SendOtpToPhoneEvent>(_onSendOtp);
    on<VerifySentOtpEvent>(_onVerifyOtp);
    on<OnPhoneOtpSent>(
      (event, emit) async => emit(
        PhoneAuthCodeSentSuccess(verificationId: event.verificationId),
      ),
    );
    on<OnPhoneAuthErrorEvent>(
      (event, emit) async => emit(PhoneAuthError(error: event.error)),
    );
    on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);
    on<OnLogOutRequestEvent>(_onLogOut);
  }
  final AuthRepositorymplementation _authRepository;

  Future<void> _onSendOtp(
    SendOtpToPhoneEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(PhoneAuthLoading());
    try {
      await _authRepository.veryPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // On [verificationComplete], we will get the credential from the firebase  and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
          add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        },
        codeSent: (String verificationId, int? resendToken) {
          // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
          add(
            OnPhoneOtpSent(
              verificationId: verificationId,
              token: resendToken,
            ),
          );
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

  Future<void> _onVerifyOtp(
    VerifySentOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(PhoneAuthLoading());
      // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      final credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _loginWithCredential(
    OnPhoneAuthVerificationCompleteEvent event,
    Emitter<AuthState> emit,
  ) async {
    // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login
    try {
      emit(LoginWithCredentialnit());
      final result = await _authRepository.signWithcredential(event.credential);
      result.fold(
        (error) => emit(PhoneAuthError(error: error.message)),
        (user) {
          //   if (user.user != null) {
          emit(PhoneAuthVerified(user: user));
          //  }
        },
      );
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _onLogOut(
    OnLogOutRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLogOutInit());
      await _authRepository.signOut();
      emit(AuthLogOutSuccess());
    } catch (e) {
      emit(AuthLogOutError(error: e.toString()));
    }
  }

  Future<void> _onAppStart(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthAppStartInit());
    try {
      logInfo('what up app started successfully');
      final token = await _authRepository.getIdToken;
      final user =  _authRepository.currentUser;
      logInfo('the token is: $token and user is ${user.toJson()}');
      emit(AuthAppStartSuccess(
        user: user
      ));
    } catch (e) {
      logError(e.toString());
      emit(AuthAppStartError(error: e.toString()));
    }
  }
}
