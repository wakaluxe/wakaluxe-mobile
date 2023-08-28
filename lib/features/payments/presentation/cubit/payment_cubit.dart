import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:wakaluxe/src/common/Utils/enums.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentsState> {
  PaymentCubit() : super(PaymentsInitialState());

  void updatePaymentMethod(PaymentMethodsType type) {
    emit(PaymentUpdatePaymentTypeState(type: type));
  }

  void addPaymentInformation({required String amount, required String number}) {
    emit(AddPaymentInformationState(amount: amount, accountNumber: number));
  }

  Future<void> paymentProcessing() async {
    emit(
      PaymentProcessingState(processingValue: state.processingValue + 0.2),
    );
    await Future.delayed(const Duration(seconds: 3));
    emit(const PaymentProcessedState());

    /* Timer.periodic(const Duration(seconds: 3), (timer) {
      if (state.processingValue == 1) {
        timer.cancel();
        emit(const PaymentProcessedState());
      } else {
        emit(
          PaymentProcessingState(processingValue: state.processingValue + 0.2),
        );
      }
    }); */
  }
}
