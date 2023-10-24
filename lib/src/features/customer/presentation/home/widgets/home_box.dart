import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class HomeBox extends StatelessWidget {
  const HomeBox({
    required this.t, required this.title, required this.icon, required this.onTap, super.key,
  });

  final TextTheme t;
  final String title;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: context.colorScheme.scrim.withOpacity(0.04),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(icon),
            10.h.vGap,
            Text(
              title,
              style: t.body2,
            ),
          ],
        ),
      ),
    );
  }
}
