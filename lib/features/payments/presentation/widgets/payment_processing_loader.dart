import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentsState>(
      builder: (context, state) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(seconds: 10),
    curve: Curves.easeInOut,
tween: Tween<double>(
        begin: state.processingValue - 0.2,
        end: state.processingValue,
    ),
          builder: (context, value, _) {
            return LinearProgressIndicator(
              color: context.colorScheme.primary,
              backgroundColor: Colors.grey[200],
              value: value,
            );
          },
        );
      },
    );
  }
}
