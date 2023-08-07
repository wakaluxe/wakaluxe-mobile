import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxeRoundedButton extends StatelessWidget {
  const WakaluxeRoundedButton({
    required this.text,
    super.key,
    this.color,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: context.scheme.onBackground.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: ClipPath(
            clipper: const ShapeBorderClipper(
              shape: CircleBorder(),
            ),
            child: Container(
              color: color ?? context.scheme.tertiary,
              width: 45,
              height: 45,
              child: Center(
                child: Text(
                  text,
                  style: context.bodyMdBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
