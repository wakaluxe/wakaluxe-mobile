import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@RoutePage()
class PaymentProcessingScreen extends StatefulWidget {
  const PaymentProcessingScreen({Key? key}) : super(key: key);
  static String name = '/payment-processing';

  @override
  State<PaymentProcessingScreen> createState() =>
      _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 100.h,
          horizontal: 20.0.w,
        ),
        child: BlocListener<PaymentCubit, PaymentsState>(
            listener: (context, state) {
              if (state is PaymentProcessedState) {
                logInfo('Payment processed');
                context.router
                    .pushAndPopUntil(HomeMap(), predicate: (_) => true);
              }
            },
            child: Column(
              children: <Widget>[
                Text(
                  'Processing your payment',
                  style: textTheme.body1,
                ),
                17.h.vGap,
                Loader(),
                170.h.vGap,
                Text(
                  'Please wait a moment while we process your payment. It might take 5 minutes or more.',
                  style: textTheme.label,
                  textAlign: TextAlign.center,
                )
              ],
            )),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentsState>(
      builder: (context, state) {
        return LinearProgressIndicator(
          color: (context.scheme.primary),
          backgroundColor: Colors.grey[200],
          value: state.processingValue,
        );
      },
    );
  }
}
