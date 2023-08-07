import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeLocationWidget extends StatelessWidget {
  const WakaluxeLocationWidget({
    required this.leading,
    required this.trainling,
    required this.message,
    required this.onTap,
    super.key,
  });
  final Icon leading;
  final Icon trainling;
  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: leading,
            ),
            14.hGap,
            Expanded(
              flex: 4,
              child: Text(
                message,
                style: context.bodySm.copyWith(
                  color: context.colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            14.hGap,
            Expanded(
              child: trainling,
            )
          ],
        ),
      ),
    );
  }
}
