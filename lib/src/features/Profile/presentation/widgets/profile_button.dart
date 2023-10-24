import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    required this.title, required this.onTap, required this.t, super.key,
  });
  final String title;
  final void Function() onTap;

  final TextTheme t;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 11.w,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(
          title,
          style: t.button1,
        ),
      ),
    );
  }
}
