import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxEditButton extends StatelessWidget {
  const WakaluxEditButton({
    Key? key,
    required this.t,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final TextTheme t;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          color: context.scheme.primary,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(
          text,
          style: t.button1,
        ),
      ),
    );
  }
}
