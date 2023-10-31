// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wakaluxe/src/common/Utils/helpers.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/auth_source_route.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@RoutePage(
  name: 'SignUp',
)
class WakaluxeSignUp extends StatefulWidget {
  const WakaluxeSignUp({super.key, this.route = AuthSourceRoute.unknown});

  final AuthSourceRoute route;

  @override
  State<WakaluxeSignUp> createState() => _WakaluxeSignUpState();
}

class _WakaluxeSignUpState extends State<WakaluxeSignUp> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _trimedPhoneNumber = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final phoneFormatter = MaskTextInputFormatter(
      mask: '+237 ###-##-##-##',
      filter: {'#': RegExp('[0-9]')},
    );
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is PhoneAuthVerified) {
          context.router.pushNamed('/home');
        }
        if (state is PhoneAuthCodeSentSuccess) {
          context.router.push(
            Verification(
              phoneNumber: _trimedPhoneNumber,
              verificationd: state.verificationId,
            ),
          );
        }
        // Show error message if any error occurs while verifying phone number and otp code
        if (state is PhoneAuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: AppBarredScaffold(
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
                  controller: _controller,
                  formatter: [phoneFormatter],
                  icon: Constants.hashtagIcon,
                  validator: phoneNumberValidator,
                ),
                45.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: text.body1,
                    ),
                    5.hGap,
                    GestureDetector(
                      onTap: () =>
                          AutoRouter.of(context).pushNamed('/phone-sign-up'),
                      child: Text(
                        'Sign In',
                        style: text.body2.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                60.vGap,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is PhoneAuthLoading) {
                      return WakaluxeButton(
                        text: 'Please Wait...',
                        color: context.colorScheme.outline,
                      );
                    }
                    return GestureDetector(
                      onTap:
                          state is PhoneAuthLoading ? null : _verifyPhoneNumber,
                      child: WakaluxeButton(
                        text: 'SIGN UP',
                        textColor: context.colorScheme.scrim,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verifyPhoneNumber() {
    _trimedPhoneNumber = _controller.text.trim();
    logInfo(_trimedPhoneNumber);
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SendOtpToPhoneEvent(
              phoneNumber: _trimedPhoneNumber,
            ),
          );
    }
  }
}
