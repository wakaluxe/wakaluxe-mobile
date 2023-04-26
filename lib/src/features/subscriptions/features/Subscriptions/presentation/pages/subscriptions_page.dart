// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wakaluxe/src/configs/configs.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/padded_body.dart';

class WakaluxeSubscriptions extends StatelessWidget {
  const WakaluxeSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Text(
              'Skip',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
                color: Palette.secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: PaddedBody(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subscription Plan',
                style: text.headline,
              ),
              15.vGap,
              Text(
                'Select a subscription plan which is best suited for you.',
                style: text.body1,
              ),
              20.vGap,
              SubscriptionsCard(
                text: text,
                plan: 'Business',
                isSelected: true,
              ),
              25.vGap,
              GestureDetector(
                child: SubscriptionsCard(
                  text: text,
                  plan: 'Family',
                ),
              ),
              25.vGap,
              SubscriptionsCard(
                text: text,
                plan: 'Personal',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionsCard extends StatelessWidget {
  const SubscriptionsCard({
    required this.text,
    required this.plan,
    super.key,
    this.isSelected = false,
  });

  final TextTheme text;
  final String plan;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/subscription-detail/$plan'),
      child: Container(
        height: 173.h,
        width: 374.w,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? Palette.primary : Palette.black.withOpacity(0.05),
            width: 2.w,
          ),
          color: Palette.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '$plan Plan',
                  style: text.title,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Price/Month',
                  style: text.title,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
