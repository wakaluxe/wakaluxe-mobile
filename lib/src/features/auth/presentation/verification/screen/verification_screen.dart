import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

import 'package:wakaluxe/src/configs/configs.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return AppBarredScaffold(
      body: Column(
        children: [
          Text(
            'OTP Verification',
            style: text.display2,
          ),
          10.vGap,
          Text(
            'A verification code has been send to +237 699 99 99 99',
            style: text.body1,
          ),
          32.vGap,
          Pinput(
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(30, 60, 87, 1),
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          98.vGap,
          WakaluxeButton(
            text: 'Verify',
            action: () {},
            width: 0.4,
          ),
          24.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the code?",
                style: text.body2,
              ),
              8.hGap,
              Text(
                'Resend(30s)',
                style: text.body1.copyWith(color: Palette.primary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
