// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_cubit.dart';

class PaymentsState extends Equatable {
  PaymentsState({
    this.type = PaymentMethodsType.UNDEFINE,
    this.amount = '0',
    this.accountNumber = '',
  });
  final PaymentMethodsType type;
  final String amount;
  final String accountNumber;
  @override
  List<Object> get props => [type, amount, accountNumber];

  PaymentsState copyWith({
    PaymentMethodsType? type,
    String? amount,
    String? accountNumber,
  }) {
    return PaymentsState(
      type: type ?? this.type,
      amount: amount ?? this.amount,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }
}

class PaymentsInitialState extends PaymentsState {}

class PaymentUpdatePaymentTypeState extends PaymentsState {
  PaymentUpdatePaymentTypeState({required super.type});
}

class AddPaymentInformationState extends PaymentsState {
  AddPaymentInformationState(
      {required super.amount, required super.accountNumber});
}
