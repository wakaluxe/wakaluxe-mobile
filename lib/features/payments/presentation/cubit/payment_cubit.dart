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
}
