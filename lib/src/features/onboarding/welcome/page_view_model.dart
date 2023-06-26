import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';

PageViewModel wakaluxPageViewModel({
  required TextTheme text,
  required String title,
  required String body,
  required String image,
  bool end = false,
  BuildContext? context,
}) {
  return PageViewModel(
    titleWidget: Text(
      title,
                  textAlign: TextAlign.center,

      style: text.display2,
    ),
    bodyWidget: SizedBox(
      width: 273.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            body,
            textAlign: TextAlign.center,
            style: text.body1,
          ),
          if (end) ...[15.vGap,
          
            WakaluxeButton(
              text: 'Get Started',
              
              action: () => AutoRouter.of(context!).pushNamed('/sign-up'),
            ),]
        ],
      ),
    ),
    image: SvgPicture.asset(
      image,
      height: 293.h,
    ),
  );
}
