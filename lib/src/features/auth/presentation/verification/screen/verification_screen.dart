// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/Utils/helpers.dart';

import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/helpers.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/auth_source_route.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/auth/presentation/verification/cubit/timer_cubit.dart';
import 'package:wakaluxe/src/features/auth/presentation/verification/cubit/timer_state.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

@RoutePage(name: 'Verification')
class WakaluxeVerification extends StatefulWidget {
  const WakaluxeVerification({
    required this.phoneNumber,
    required this.verificationd,
    super.key,
    this.route = AuthSourceRoute.unknown,
  });
  final String phoneNumber;
  final String verificationd;
  final AuthSourceRoute route;

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

  _handleConfirmVerification(String phoneNumber) {
    final type = getPhoneNumberType(phoneNumber);
    final icon = paymentMethodIcon(type);
    final method = MobilePaymentMethodModel(
      id: phoneNumber,
      name: phoneNumber,
      icon: icon,
      type: type,
    );
    context.read<PaymentCubit>().addPaymentMethods(method);
    getNavigationAuthedRouteName().then(
      (value) => context.router.pushNamed(value),
    );
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
                SnackBar(
                  content: Text(AppLocalizations.of(context).timeOut),
                ),
              );
              context.router.pop();
            }
            if (state is PhoneAuthError) {
              context.router.pop();
            }
            if (state is PhoneAuthVerified) {
              _handleConfirmVerification(widget.phoneNumber);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context).otpVerification,
                  style: text.display2,
                ),
                10.vGap,
                Text(
                  '${AppLocalizations.of(context).verificationCodeSent} ${widget.phoneNumber}',
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
                      AppLocalizations.of(context).codeNotReceived,
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
                              '${AppLocalizations.of(context).resend}(30s)',
                              style: text.body1.copyWith(
                                color: context.colorScheme.tertiary,
                              ),
                            ),
                          );
                        }
                        if (state is TimerInProgress) {
                          return Text(
                            '${AppLocalizations.of(context).pleaseWait} (${state.elapsed}s)',
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
                        text: AppLocalizations.of(context).verifying,
                        width: 0.4,
                        color: context.colorScheme.outline,
                      );
                    }
                    if (state is LoginWithCredentialnit) {
                      return WakaluxeButton(
                        text: AppLocalizations.of(context).logging,
                        width: 0.4,
                        color: context.colorScheme.outline,
                      );
                    }
                    return WakaluxeButton(
                      text: AppLocalizations.of(context).verify,
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
