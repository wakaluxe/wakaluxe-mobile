// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/padded_body.dart';

@RoutePage(
  name: 'Subscriptions',
)
class WakaluxeSubscriptions extends StatelessWidget {
  const WakaluxeSubscriptions({super.key});
  static String path = '/subscriptions';

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => context.router.pushNamed('/home-map'),
                child: Text(
                  'Skip',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: PaddedBody(
          body: SingleChildScrollView(
            child: Column(
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
                  features: const [
                    'Higher Priority than No plan',
                    'Plan pickups',
                  ],
                ),
                25.vGap,
                GestureDetector(
                  child: SubscriptionsCard(
                    text: text,
                    plan: 'Family',
                    isSelected: true,
                    features: const [
                      'Higher Priority than No plan',
                      'Plan pickups',
                    ],
                  ),
                ),
                25.vGap,
                SubscriptionsCard(
                  text: text,
                  plan: 'Personal',
                  features: const [
                    'Pay your taxi fare',
                    'Normal Priority',
                    'Pay your taxi fare',
                  ],
                ),
              ],
            ),
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
    required this.features,
    super.key,
    this.isSelected = false,
  });

  final TextTheme text;
  final String plan;
  final bool isSelected;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/subscription-detail/$plan'),
      child: Container(
        height: 173.h,
        width: 374.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
            BoxShadow(
              color: context.colorScheme.onPrimary,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3), // changes position of shadow
            ),
          ],
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.scrim.withOpacity(0.05),
            width: 2.w,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$plan Plan',
                  style: text.title,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Price/',
                        style: text.title,
                      ),
                      TextSpan(text: 'month', style: text.label),
                    ],
                  ),
                  style: text.title,
                ),
                10.vGap,
              ],
            ),
            Column(
              children: features
                  .map(
                    (e) => Row(
                      children: [
                        const Text('\u2022 ', style: TextStyle(fontSize: 8)),
                        5.hGap,
                        Text(
                          e,
                          style: text.subtitle,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
