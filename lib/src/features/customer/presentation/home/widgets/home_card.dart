import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.t,
    this.onTap,
    required this.title,
    required this.image,
  });

  final TextTheme t;
  final void Function()? onTap;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 173.h,
        width: 178.w,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              image,
              height: 100,
              width: 100,
            ),
            12.h.vGap,
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
