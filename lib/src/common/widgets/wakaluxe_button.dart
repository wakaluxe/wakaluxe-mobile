import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/configs/configs.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeButton extends StatelessWidget {
  const WakaluxeButton({
    required this.text,
    this.action,
    this.color,
    super.key,
    this.width = .9,
    this.icon,
    this.textColor,
    this.isOutline = false,
    this.svg,
    this.isSelected = false,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color? color;
  final double width;
  final Color? textColor;
  final bool isOutline;
  final bool isSelected;
  final String? svg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: context.width * width,
        height: Constants.buttonHeight,
        decoration: BoxDecoration(
          color: isOutline
              ? Theme.of(context).scaffoldBackgroundColor
              : color ?? context.colorScheme.primary,
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          border: (isOutline || isSelected)
              ? Border.all(
                  color: !isSelected
                      ? context.colorScheme.onBackground.withOpacity(0.5)
                      : context.colorScheme.tertiary,
                  width: 0.8,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svg != null) ...[
              SvgPicture.asset(
                svg!,
                height: 20,
                width: 20,
              ),
              8.hGap,
            ],
            Text(
              text,
              style: context.bodyLg.copyWith(
                color: (textColor == null)
                    ? context.colorScheme.onBackground
                    : textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null) ...[
              8.hGap,
              Icon(icon),
            ]
          ],
        ),
      ),
    );
  }
}

class WakaluxeButtonMedium extends StatelessWidget {
  const WakaluxeButtonMedium({
    required this.text,
    this.action,
    this.color = Palette.primary,
    super.key,
    this.width = .35,
    this.icon,
    this.textColor,
    this.isOutline = false,
    this.isSelected = false,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color color;
  final double width;
  final Color? textColor;
  final bool isOutline;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return WakaluxeButton(
      text: text,
      action: action,
      color: color,
      width: width,
      icon: icon,
      textColor: textColor,
      isOutline: isOutline,
      isSelected: isSelected,
    );
  }
}

class WakaluxBackhButton extends StatelessWidget {
  const WakaluxBackhButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pop(),
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
            const BoxShadow(
              color: Colors.white,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(
            Constants.backBoldIcon,
            height: 22,
            width: 17,
          ),
        ),
      ),
    );
  }
}
