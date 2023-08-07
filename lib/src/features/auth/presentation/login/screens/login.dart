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
  name: 'Login',
)
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
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
        child: Form(
          key: _formKey,
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
                controller: phoneController,
                formatter: [phoneFormatter],
                icon: Constants.hashtagIcon,
              ),
              10.h.vGap,
              WakaluxInputField(
                text: text,
                hint: 'pin',
                controller: passwordController,
                formatter: [phoneFormatter],
                obscured: true,
                icon: Constants.passwordIcon,
              ),
              45.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 68.w,
                    child: Divider(
                      color: context.colorScheme.scrim.withOpacity(0.1),
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
                      color: context.colorScheme.scrim.withOpacity(0.1),
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
                    'Don’t have an account? Sign in?',
                    style: text.body1,
                  ),
                  5.hGap,
                  GestureDetector(
                    onTap: () => AutoRouter.of(context).pushNamed('/login'),
                    child: Text(
                      'Log In',
                      style: text.body2.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              60.vGap,
              WakaluxeButton(
                action: () => context.router.pushNamed('/verification'),
                text: 'SIGN UP',
                textColor: context.colorScheme.scrim,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
