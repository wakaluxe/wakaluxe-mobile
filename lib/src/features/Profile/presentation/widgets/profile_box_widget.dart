import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class ProfileBoxWidget extends StatelessWidget {
  const ProfileBoxWidget({
    required this.t,
    required this.title,
    required this.value,
    super.key,
  });

  final TextTheme t;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.primaryColor,
            width: 1.5.w,
          ),
          color: context.theme.primaryColor.withOpacity(0.48),
        ),
        child: Column(
          children: <Widget>[
            Text(
              value,
              style: t.display2,
            ),
            9.h.vGap,
            Text(
              title,
              style: t.body2,
            )
          ],
        ),
      ),
    );
  }
}
