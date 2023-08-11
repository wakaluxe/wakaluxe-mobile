// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              Hicons.gift_1,
              color: context.colorScheme.onBackground,
            ),
            4.hGap,
            Flexible(
              child: Text(
                'Our prices are 50% discounted for the celebration of our 5th anniversary. Hurry up and enjoy.🎉',
                style: context.bodyMd.copyWith(
                  fontSize: 12.sp,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
