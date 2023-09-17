// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget(
      {Key? key,
      required this.textTheme,
      required this.title,
      this.icon,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final TextTheme textTheme;
  final String title;
  final String? icon;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.outline,
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
      ),
    );
  }
}
