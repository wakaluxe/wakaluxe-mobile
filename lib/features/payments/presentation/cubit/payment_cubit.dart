// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_type.dart';
import 'package:wakaluxe/features/payments/domain/usecases/add_payment_methods_usecase.dart';
import 'package:wakaluxe/features/payments/domain/usecases/get_payment_methods_usecase.dart';
import 'package:wakaluxe/features/payments/domain/usecases/remove_payment_methods_usecase.dart';
import 'package:wakaluxe/src/configs/usecase.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentsState> {
  PaymentCubit(
    this._getPaymentMethodsUsCase,
    this._addPaymentMethodsUsCase,
    this._removePaymentMethodsUseCase,
  ) : super(PaymentsInitialState());

  void updatePaymentMethod(MobilePaymentMethodModel selected) {
    emit(PaymentUpdatePaymentTypeState(selected: selected));
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

  Future<void> getPaymentMethods() async {
    emit(PaymentGetPaymentMethodsInitialState());
    try {
      final result = await _getPaymentMethodsUsCase(NoParams());
      emit(PaymentGetPaymentMethodsSuccessState(methods: result));
    } catch (e) {
      emit(PaymentGetPaymentMethodsErrorState(error: e.toString()));
    }
  }

  Future<void> addPaymentMethods(MobilePaymentMethodModel method) async {
    emit(PaymentAddPaymentMethodInitialState());
    try {
      await _addPaymentMethodsUsCase(method);
      emit(PaymentAddPaymentMethodSuccessState());
    } catch (e) {
      emit(PaymentAddPaymentMethodErrorState(error: e.toString()));
    }
  }

  Future<void> removePaymentMethods(MobilePaymentMethodModel method) async {
    emit(PaymentRemovePaymentMethodInitialState());
    try {
      await _removePaymentMethodsUseCase(method);
      emit(PaymentRemovePaymentMethodSuccessState());
    } catch (e) {
      emit(PaymentRemovePaymentMethodErrorState(error: e.toString()));
    }
  }

  final GetPaymentMethodsUsecase _getPaymentMethodsUsCase;
  final AddPaymentMethodsUsecase _addPaymentMethodsUsCase;
  final RemovePaymentMethodsUseCase _removePaymentMethodsUseCase;
}
