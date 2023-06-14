// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

@RoutePage(
  name: 'SignUp',
)
class WakaluxeSignUp extends StatefulWidget {
  const WakaluxeSignUp({super.key});

  @override
  State<WakaluxeSignUp> createState() => _WakaluxeSignUpState();
}

class _WakaluxeSignUpState extends State<WakaluxeSignUp> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return AppBarredScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Create a new account',
              style: text.display3,
            ),
            31.vGap,
            WakaluxInputField(
              text: text,
              hint: 'Email',
              controller: emailController,
<<<<<<< HEAD
              //TODO: update icon
              icon: Constants.starIcon,
=======
              icon: Constants.mailIcon,
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
            ),
            30.vGap,
            WakaluxInputField(
              text: text,
              hint: 'Password',
              controller: passwordController,
<<<<<<< HEAD
              //TODO: update icon
              icon: Constants.starIcon,
              suffix: Constants.starIcon,
=======
              icon: Constants.passwordIcon,
              suffix: Constants.visibleIcon,
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
              obscured: true,
            ),
            30.vGap,
            WakaluxInputField(
              text: text,
              hint: 'Confirm Password',
              controller: confirmPasswordController,
<<<<<<< HEAD
              //TODO: update icon
              icon: Constants.starIcon,
              suffix: Constants.starIcon,
=======
              icon: Constants.passwordIcon,
              suffix: Constants.notVisibleIcon,
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
              obscured: true,
            ),
            60.vGap,
            WakaluxeButton(
              action: () => context.router.pushNamed('/phone-number'),
              text: 'SIGN UP',
              textColor: context.scheme.scrim,
            ),
            45.vGap,
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
            44.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO: update icons
                SvgPicture.asset(Constants.starIcon),
                24.hGap,
                SvgPicture.asset(Constants.starIcon),
              ],
            ),
            33.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: text.body1,
                ),
                5.hGap,
                GestureDetector(
                  onTap: () => AutoRouter.of(context).pushNamed('/login'),
                  child: Text(
                    'Sign In',
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
