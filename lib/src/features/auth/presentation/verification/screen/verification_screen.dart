// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/auth/presentation/verification/cubit/timer_cubit.dart';
import 'package:wakaluxe/src/features/auth/presentation/verification/cubit/timer_state.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart';


@RoutePage(name: 'Verification')
class WakaluxeVerification extends StatefulWidget {
  const WakaluxeVerification({
    required this.phoneNumber,
    required this.verificationd,
    super.key,
  });
  final String phoneNumber;
  final String verificationd;

  @override
  State<WakaluxeVerification> createState() => _WakaluxeVerificationState();
}

class _WakaluxeVerificationState extends State<WakaluxeVerification> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => TimerCubit(),
      //  child: WillPopScope(
      //  onWillPop: () async => false,
      child: AppBarredScaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is PhoneAuthCodeRetrievalTimeOut) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Time out'),
                ),
              );
             context.router.pop();
            }
            if (state is PhoneAuthError) {
              context.router.pop();
            }
            if (state is PhoneAuthVerified) {
              context.router
                  .pushNamed(WakaluxeSubscriptions.path);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'OTP Verification',
                  style: text.display2,
                ),
                10.vGap,
                Text(
                  'A verification code has been send to ${widget.phoneNumber}',
                  style: text.body1,
                ),
                32.vGap,
                Pinput(
                  controller: controller,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(30, 60, 87, 1),
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(234, 239, 243, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
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
                    BlocConsumer<TimerCubit, TimerState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is TimerInitial) {
                          return GestureDetector(
                            // onTap: ,
                            child: Text(
                              'Resend(30s)',
                              style: text.body1.copyWith(
                                color: context.colorScheme.tertiary,
                              ),
                            ),
                          );
                        }
                        if (state is TimerInProgress) {
                          return Text(
                            'please wait (${state.elapsed}s)',
                            style: text.body1
                                .copyWith(color: context.colorScheme.tertiary),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
                98.vGap,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is PhoneAuthLoading) {
                      return WakaluxeButton(
                        text: 'verifying...',
                        width: 0.4,
                        color: context.colorScheme.outline,
                      );
                    }
                    if (state is LoginWithCredentialnit) {
                      return WakaluxeButton(
                        text: 'logging you in...',
                        width: 0.4,
                        color: context.colorScheme.outline,
                      );
                    }
                    return WakaluxeButton(
                      text: 'Verify',
                      action: _handleVerifyOtp,
                      width: 0.4,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      //    ),
    );
  }

  void _handleVerifyOtp() {
    context.read<AuthBloc>().add(
          VerifySentOtpEvent(
            otpCode: controller.text,
            verificationId: widget.verificationd,
          ),
        );
  }
}
