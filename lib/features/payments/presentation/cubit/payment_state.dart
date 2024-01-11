// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_cubit.dart';

class PaymentsState extends Equatable {
  const PaymentsState({
    this.selected = const MobilePaymentMethodModel(
      id: '',
      name: '',
      icon: '',
      type: PaymentMethodType.UNDERFINED,
    ),
    this.amount = '0',
    this.accountNumber = '',
    this.processingValue = 0.0,
    this.error = '',
    this.methods = const [],
  });
  final MobilePaymentMethodModel selected;
  final String amount;
  final String accountNumber;
  final double processingValue;
  final String error;
  final List<MobilePaymentMethodModel> methods;
  @override
  List<Object> get props =>
      [selected, amount, accountNumber, processingValue, error, methods];

  PaymentsState copyWith({
    MobilePaymentMethodModel? type,
    String? amount,
    String? accountNumber,
    double? processingValue,
  }) {
    return PaymentsState(
      selected: type ?? selected,
      amount: amount ?? this.amount,
      accountNumber: accountNumber ?? this.accountNumber,
      processingValue: processingValue ?? this.processingValue,
    );
  }
}

class PaymentsInitialState extends PaymentsState {}

class PaymentUpdatePaymentTypeState extends PaymentsState {
  const PaymentUpdatePaymentTypeState({required super.selected});
}

class AddPaymentInformationState extends PaymentsState {
  const AddPaymentInformationState({
    required super.amount,
    required super.accountNumber,
  });
}

class PaymentProcessingState extends PaymentsState {
  const PaymentProcessingState({required super.processingValue});
}

class PaymentProcessedState extends PaymentsState {
  const PaymentProcessedState() : super(processingValue: 0);
}

class PaymentGetPaymentMethodsInitialState extends PaymentsState {}

class PaymentGetPaymentMethodsSuccessState extends PaymentsState {
  const PaymentGetPaymentMethodsSuccessState({required this.methods});
  @override
  final List<MobilePaymentMethodModel> methods;
}

class PaymentGetPaymentMethodsErrorState extends PaymentsState {
  const PaymentGetPaymentMethodsErrorState({required this.error});
  @override
  final String error;
}

class PaymentAddPaymentMethodInitialState extends PaymentsState {}

class PaymentAddPaymentMethodSuccessState extends PaymentsState {}

class PaymentAddPaymentMethodErrorState extends PaymentsState {
  const PaymentAddPaymentMethodErrorState({super.error});
}

class PaymentRemovePaymentMethodInitialState extends PaymentsState {}

class PaymentRemovePaymentMethodSuccessState extends PaymentsState {}

class PaymentRemovePaymentMethodErrorState extends PaymentsState {
  const PaymentRemovePaymentMethodErrorState({super.error});
}
