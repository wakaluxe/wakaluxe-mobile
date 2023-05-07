import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

@RoutePage(
  name: 'Login',
)
class WakaluxeLogin extends StatefulWidget {
  const WakaluxeLogin({super.key});

  @override
  State<WakaluxeLogin> createState() => _WakaluxeLoginState();
}

class _WakaluxeLoginState extends State<WakaluxeLogin> {
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return AppBarredScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Login to your Account',
              style: text.display3,
            ),
            31.vGap,
            WakaluxInputField(
              text: text,
              hint: 'Email',
              controller: emailController,
              icon: Constants.emailAsset,
            ),
            30.vGap,
            WakaluxInputField(
              text: text,
              hint: 'Password',
              controller: passwordController,
              icon: Constants.passwordAsset,
              suffix: Constants.visibleAsset,
              obscured: true,
            ),
            30.vGap,
            Row(
              children: [
                Checkbox(value: false, onChanged: (val) {}),
                15.hGap,
                Text(
                  'Remember me',
                  style: text.body1,
                ),
                const Spacer(),
                GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: text.body1,
                  ),
                )
              ],
            ),
            50.vGap,
            WakaluxeButton(
              text: 'SIGN IN',
              action: () => AutoRouter.of(context).pushNamed('/phone-number'),
              textColor: context.scheme.scrim,
            ),
            60.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 68.w,
                  child: Divider(
                    color: context.scheme.scrim.withOpacity(0.1),
                    thickness: 2.r,
                  ),
                ),
                10.hGap,
                Text(
                  'Or Continue with',
                  style: text.body2,
                ),
                10.hGap,
                SizedBox(
                  width: 68.w,
                  child: Divider(
                    color: context.scheme.scrim.withOpacity(0.1),
                    thickness: 2.r,
                  ),
                ),
              ],
            ),
            36.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Constants.facebookAsset),
                24.hGap,
                SvgPicture.asset(Constants.googleAsset),
              ],
            ),
            36.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: text.body1,
                ),
                5.hGap,
                GestureDetector(
                  onTap: () => AutoRouter.of(context).pushNamed('/sign-up'),
                  child: Text(
                    'Sign Up',
                    style: text.body2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
