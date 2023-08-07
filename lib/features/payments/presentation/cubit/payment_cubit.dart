import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../src/common/Utils/enums.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentsState> {
  PaymentCubit() : super(PaymentsInitialState());

  void updatePaymentMethod(PaymentMethodsType type) {
    emit(PaymentUpdatePaymentTypeState(type: type));
  }

  void addPaymentInformation({required String amount, required String number}) {
    emit(AddPaymentInformationState(amount: amount, accountNumber: number));
  }

  void paymentProcessing() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.processingValue >= 1) {
        timer.cancel();
    emit(PaymentProcessedState());
      }
      emit(PaymentProcessingState(processingValue: state.processingValue + 0.1));
    });
  }
}
