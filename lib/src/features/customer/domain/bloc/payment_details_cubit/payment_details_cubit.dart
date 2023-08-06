import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/payment_details_cubit/payment_details_state.dart';

class PaymentDetailsCubit extends Cubit<PaymentDetailsState> {
  PaymentDetailsCubit({
    required this.driverNumber,
    required this.taxiFare,
    required this.customerNumber,
  }) : super(
          PaymentDetailsState(
            driverNumber: driverNumber.text,
            taxiFare: taxiFare.text,
            customerNumber: customerNumber.text,
          ),
        );

  final TextEditingController driverNumber;
  final TextEditingController taxiFare;
  final TextEditingController customerNumber;

  void onDriverNumberChanged(String value) {
    emit(
      state.copyWith(
        driverNumber: value,
      ),
    );
  }

  void onTaxiFareChanged(String value) {
    emit(
      state.copyWith(
        taxiFare: value,
      ),
    );
  }
}
