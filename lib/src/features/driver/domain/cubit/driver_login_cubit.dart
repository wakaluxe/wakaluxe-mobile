import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:wakaluxe/src/features/driver/domain/cubit/driver_login_state.dart';

class DriverLoginCubit extends Cubit<DriverLoginState> {
  DriverLoginCubit({
    required this.emailPhoneController,
    required this.driverIdNoController,
    required this.pinController,
  }) : super(const DriverLoginInitial());
  final TextEditingController emailPhoneController;
  final TextEditingController driverIdNoController;
  final TextEditingController pinController;

  // handle all the checks
  void onEmailPhoneChanged({required String value}) {
    emit(
      state.copyWith(
        emailPhone: value,
      ),
    );
  }

  void onDriverIdNoChanged({required String value}) {
    emit(
      state.copyWith(
        driverIdNo: value,
      ),
    );
  }

  void onPinChanged({required String value}) {
    emit(
      state.copyWith(
        pin: value,
      ),
    );
  }

  void onVisibilityChanged({required bool value}) {
    emit(
      state.copyWith(
        isVisible: value,
      ),
    );
  }
  
}
