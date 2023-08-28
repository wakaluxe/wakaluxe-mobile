import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentsState>(
      builder: (context, state) {
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
