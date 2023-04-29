// ignore_for_file: public_member_api_docs, sort_constructors_first

class PaymentDetailsState {
  final String driverNumber;
  final String taxiFare;
  final String customerNumber;
  PaymentDetailsState({
    required this.driverNumber,
    required this.taxiFare,
    required this.customerNumber,
  });

  PaymentDetailsState copyWith({
    String? driverNumber,
    String? taxiFare,
    String? customerNumber,
  }) {
    return PaymentDetailsState(
      driverNumber: driverNumber ?? this.driverNumber,
      taxiFare: taxiFare ?? this.taxiFare,
      customerNumber: customerNumber ?? this.customerNumber,
    );
  }
}
