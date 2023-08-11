// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_cubit.dart';

class PaymentsState extends Equatable {
  const PaymentsState({
    this.type = PaymentMethodsType.UNDEFINE,
    this.amount = '0',
    this.accountNumber = '',
     this.processingValue = 0.0,
  });
  final PaymentMethodsType type;
  final String amount;
  final String accountNumber;
  final double processingValue;
  @override
  List<Object> get props => [type, amount, accountNumber, processingValue];

  PaymentsState copyWith({
    PaymentMethodsType? type,
    String? amount,
    String? accountNumber,
    double? processingValue,
  }) {
    return PaymentsState(
      type: type ?? this.type,
      amount: amount ?? this.amount,
      accountNumber: accountNumber ?? this.accountNumber,
      processingValue: processingValue ?? this.processingValue,
    );
  }
}

class PaymentsInitialState extends PaymentsState {}

class PaymentUpdatePaymentTypeState extends PaymentsState {
  const PaymentUpdatePaymentTypeState({required super.type});
}

class AddPaymentInformationState extends PaymentsState {
  const AddPaymentInformationState(
      {required super.amount, required super.accountNumber,});
}

class PaymentProcessingState extends PaymentsState {
  const PaymentProcessingState({required super.processingValue});
}

class PaymentProcessedState extends PaymentsState {
  const PaymentProcessedState():super(processingValue: 0);
}