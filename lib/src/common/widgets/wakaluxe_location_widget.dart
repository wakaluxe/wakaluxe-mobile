import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeLocationWidget extends StatelessWidget {
  const WakaluxeLocationWidget({
    required this.leading,
    required this.message,
    required this.onTap,
    super.key,
  });
  final Icon leading;
  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60.h,
        width: 250.w,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onBackground.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading,
            8.hGap,
            Text(
              message,
              style: context.bodySm.copyWith(
                color: context.colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
