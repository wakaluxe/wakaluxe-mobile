import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

<<<<<<< HEAD
@RoutePage(name: 'VerifyPassword')
=======
@RoutePage()    
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
class VerifyPassword extends StatelessWidget {
  const VerifyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const WakaluxBackButton(),
        title: Text(
          'Forgot Password',
          style: theme.title,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 22.w,
        ),
        width: context.width,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.h),
            Text(
              'Code has been sent to  +2376******03',
              style: theme.body1,
            ),
            49.vGap,
            const Pinput(
              length: 6,
              obscureText: true,
            ),
            68.vGap,
            Text.rich(
              TextSpan(
                text: 'Resend Code in',
                style: theme.body1,
                children: [
                  TextSpan(
                    text: '60 s',
                    style: theme.body1.copyWith(
                      color: context.scheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            WakaluxeButton(
              text: 'Verify',
              action: () => context.router.pushNamed('/create-new-password'),
            ),
          ],
        ),
      ),
    );
  }
}
