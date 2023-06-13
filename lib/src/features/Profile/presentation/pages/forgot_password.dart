import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
@RoutePage()    
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const WakaluxBackhButton(),
        title: Text('Forgot Password', style: theme.title),
      ),
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset(Constants.forgotPassword, height: 300.h,)),
              ),
              SizedBox(height: 25.h),
              Text(
                'Select which contact details should be used to reset your password.',
                style: theme.body1,
              ),
              40.vGap,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: context.scheme.primary),
                ),
                child: ListTile(
                  title: Text(
                    'Via SMS',
                    style: theme.label,
                  ),
                  subtitle: Text(
                    '+23769*****03',
                    style: theme.body2,
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: context.scheme.tertiary,
                    child: SvgPicture.asset(Constants.callIcon),
                  ),
                ),
              ),
              15.vGap,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: context.scheme.outline),
                ),
                child: ListTile(
                  title: Text(
                    'Via Email',
                    style: theme.label,
                  ),
                  subtitle: Text(
                    'chen*****@yourdomain.com',
                    style: theme.body2,
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: context.scheme.error,
                    child: SvgPicture.asset(Constants.mailIcon),
                  ),
                ),
              ),
              const Spacer(),
              WakaluxeButton(
                text: 'Continue',
                action: () => context.router.pushNamed('/verify-password'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
