// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  late TextEditingController controller;
  
  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
     final phoneFormatter = MaskTextInputFormatter(
      mask: '+237 ###-##-##-##',
      filter: {'#': RegExp('[0-9]')},
    );
    return AppBarredScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your Phone Number',
              style: text.display3,
            ),
            10.h.vGap,
            Text(
              'We will send you a verification code',
              style: text.body1,
            ),
            31.vGap,
            WakaluxInputField(
              text: text,
              hint: '+237 699 99 99 99',
              controller: controller,
              formatter: [phoneFormatter],
              icon: Constants.hashtagIcon,
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
            const WakaluxeButton(
              text: 'Google',
              svg: Constants.googleAsset,
              isOutline: true,
              // color: ,
            ),
            10.vGap,
            const WakaluxeButton(
              text: 'Facebook',
              svg: Constants.facebookAsset,
              isOutline: true,
            ),
            10.vGap,
            const WakaluxeButton(
              text: 'Apple',
              svg: Constants.appleAsset,
              isOutline: true,
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
                    style: text.body2.copyWith(
                      color: context.scheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            60.vGap,
            WakaluxeButton(
              action: () => context.router.pushNamed('/verification'),
              text: 'SIGN UP',
              textColor: context.scheme.scrim,
            ),
          ],
        ),
      ),
    );
  }
}

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wakaluxe/src/common/common.dart';
// import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
// import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
// import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
// import 'package:wakaluxe/src/extensions/build_context.dart';
// import 'package:wakaluxe/src/extensions/num.dart';
// import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

// @RoutePage(
//   name: 'SignUp',
// )
// class WakaluxeSignUp extends StatefulWidget {
//   const WakaluxeSignUp({super.key});

//   @override
//   State<WakaluxeSignUp> createState() => _WakaluxeSignUpState();
// }

// class _WakaluxeSignUpState extends State<WakaluxeSignUp> {
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   late TextEditingController confirmPasswordController;
//   @override
//   void initState() {
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     confirmPasswordController = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final text = Theme.of(context).textTheme;
//     return AppBarredScaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(
//               'Enter your Phone Number',
//               style: text.display3,
//             ),
//             31.vGap,
//             WakaluxInputField(
//               text: text,
//               hint: 'Email',
//               controller: emailController,
//               icon: Constants.mailIcon,
//             ),
//             30.vGap,
//             WakaluxInputField(
//               text: text,
//               hint: 'Password',
//               controller: passwordController,
//               icon: Constants.passwordIcon,
//               // suffix: Constants.visibleIcon,
//               obscured: true,
//             ),
//             30.vGap,
//             WakaluxInputField(
//               text: text,
//               hint: 'Confirm Password',
//               controller: confirmPasswordController,
//               icon: Constants.passwordIcon,
//               // suffix: Constants.notVisibleIcon,
//               obscured: true,
//             ),
//             45.vGap,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 68.w,
//                   child: Divider(
//                     color: context.scheme.scrim.withOpacity(0.1),
//                     thickness: 2.r,
//                   ),
//                 ),
//                 10.hGap,
//                 Text(
//                   'Or Continue with',
//                   style: text.body2,
//                 ),
//                 10.hGap,
//                 SizedBox(
//                   width: 68.w,
//                   child: Divider(
//                     color: context.scheme.scrim.withOpacity(0.1),
//                     thickness: 2.r,
//                   ),
//                 ),
//               ],
//             ),
//             44.vGap,
//             const WakaluxeButton(
//               text: 'Google',
//               svg: Constants.googleAsset,
//               isOutline: true,
//               // color: ,
//             ),
//             10.vGap,
//             const WakaluxeButton(
//               text: 'Facebook',
//               svg: Constants.facebookAsset,
//               isOutline: true,
//             ),
//             33.vGap,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Already have an account?',
//                   style: text.body1,
//                 ),
//                 5.hGap,
//                 GestureDetector(
//                   onTap: () => AutoRouter.of(context).pushNamed('/login'),
//                   child: Text(
//                     'Sign In',
//                     style: text.body2,
//                   ),
//                 ),
//               ],
//             ),
//             60.vGap,
//             WakaluxeButton(
//               action: () => context.router.pushNamed('/verification'),
//               text: 'SIGN UP',
//               textColor: context.scheme.scrim,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
