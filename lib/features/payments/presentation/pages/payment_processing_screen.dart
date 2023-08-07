import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage()
class PaymentProcessingScreen extends StatelessWidget {
  const PaymentProcessingScreen({Key? key}) : super(key: key);
  static String name = '/payment-processing';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 100.h,
          horizontal: 20.0.w,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Processing your payment',
              style: textTheme.body1,
            ),
            17.h.vGap,
            LinearProgressIndicator(
              color: (context.scheme.primary),
              backgroundColor: Colors.grey[200],
              value: 0.33,
            ),
            170.h.vGap,
            Text(
              'Please wait a moment while we process your payment. It might take 5 minutes or more.',
              style: textTheme.label,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}