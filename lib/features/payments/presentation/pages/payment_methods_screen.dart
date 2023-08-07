// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/common.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
            horizontal: 20.w,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Payment Methods',
                style: textTheme.title,
              ),
              10.h.vGap,
              Text(
                'Select a preferred Payment method ',
                style: textTheme.body1,
              ),
              32.h.vGap,
              PaymentCardWidget(
                textTheme: textTheme,
                title: 'MTN Mobile Money',
                icon: Constants.mtnMoneyIcon,
              ),
              5.h.vGap,
              PaymentCardWidget(
                textTheme: textTheme,
                title: 'Orange Mobile Money',
                icon: Constants.orangeMoneyIcon,
              ),
              5.h.vGap,
              PaymentCardWidget(
                textTheme: textTheme,
                title: 'Visa Card',
                icon: Constants.masterCardIcon,
              ),
              5.h.vGap,
              PaymentCardWidget(
                textTheme: textTheme,
                title: 'Cash',
              ),
              const Spacer(),
              const WakaluxeButton(
                text: 'Confirm',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    required this.textTheme,
    required this.title,
    super.key,
    this.icon,
  });

  final TextTheme textTheme;
  final String title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: context.scheme.primary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: <Widget>[
          if (icon == null) const SizedBox() else SvgPicture.asset(icon!),
          18.w.hGap,
          Text(
            title,
            style: textTheme.body2,
          ),
        ],
      ),
    );
  }
}
