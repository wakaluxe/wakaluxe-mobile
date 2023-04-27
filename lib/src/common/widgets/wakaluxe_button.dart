import 'package:flutter/material.dart';
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
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color? color;
  final double width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: context.width * width,
        height: Constants.buttonHeight,
        decoration: BoxDecoration(
          color: color ?? context.scheme.tertiary,
          borderRadius: BorderRadius.circular(Constants.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: context.bodyLg.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor ?? context.scheme.scrim,
              ),
            ),
            if (icon != null) ...[
              8.hGap,
              Icon(icon),
            ] else
              const SizedBox.shrink(),
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
    this.color,
    super.key,
    this.width = .35,
    this.icon,
  });
  final IconData? icon;
  final String text;
  final VoidCallback? action;
  final Color? color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return WakaluxeButton(
      text: text,
      action: action,
      color: color ?? context.scheme.tertiary,
      width: width,
      icon: icon,
    );
  }
}
