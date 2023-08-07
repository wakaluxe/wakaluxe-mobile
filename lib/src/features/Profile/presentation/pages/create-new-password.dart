import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage()
class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Password'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Transform.scale(
                scale: 1,
                child: SvgPicture.asset(
                  Constants.newPassword,
                  height: 280.h,
                ),
              ),
              28.vGap,
              const WakaluxInputField(),
              20.vGap,
              const WakaluxInputField(),
              40.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  15.hGap,
                  Text(
                    'Remember Me',
                    style: theme.button1,
                  ),
                ],
              ),
              60.vGap,
              WakaluxeButton(
                text: 'Confirm',
                action: () => context.router.pushNamed('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WakaluxInputField extends StatelessWidget {
  const WakaluxInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: context.colorScheme.outlineVariant.withOpacity(0.3),
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset(Constants.passwordIcon),
          ),
          hintText: 'New Password',
          suffixIcon: const Icon(Icons.visibility),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        ),
      ),
    );
  }
}
