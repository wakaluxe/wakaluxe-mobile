// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/padded_body.dart';

import 'package:wakaluxe/src/configs/configs.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/subscriptions_amount.dart';

class WakaluxeSubscriptionDetail extends StatelessWidget {
  const WakaluxeSubscriptionDetail({
    super.key,
    @PathParam('plan') required this.plan,
  });

  final String plan;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: PaddedBody(
        body: Padding(
          padding: EdgeInsets.only(top: 42.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const BackButton(),
              30.vGap,
              Text('$plan Plan'),
              15.vGap,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${subscription_amount(plan)}/',
                      style: text.display3,
                    ),
                    TextSpan(text: 'month', style: text.body2)
                  ],
                ),
              ),
              40.vGap,
              Text(
                'Description',
                style: text.body1,
              ),
              const Spacer(),
              const WakaluxeButton(
                text: 'Subscribe',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0.h,
      ),
      child: InkWell(
        onTap: () => context.router.pop(),
        child: ElevatedButton(
          onPressed: () => context.router.pop(),
          style: ElevatedButton.styleFrom(
            foregroundColor: Palette.neutral,
            elevation: 10,
            minimumSize: const Size(45, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: SvgPicture.asset('assets/Icons/back.svg'),
        ),
      ),
    );
  }
}
