import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class PaymentProcessingScreen extends StatelessWidget {
  const PaymentProcessingScreen({Key? key}) : super(key: key);

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
              valueColor: AlwaysStoppedAnimation<Color>(context.scheme.primary),
              backgroundColor: Colors.grey[200],
              value: 33,
            ),
            170.h.vGap,
            Text(
              'Please wait a moment while we process your payment. It might take 5 minutes or more.',
              style: textTheme.label,
            )
          ],
        ),
      ),
    );
  }
}
