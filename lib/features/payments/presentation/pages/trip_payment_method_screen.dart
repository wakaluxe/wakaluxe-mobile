// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_type.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_information_screen.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_processing_screen.dart';
import 'package:wakaluxe/features/payments/presentation/widgets/add_payment_method.dart';
import 'package:wakaluxe/features/payments/presentation/widgets/payment_card_widget.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/Utils/enums.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/configs.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage()
class TripPaymentMethodsScreen extends StatefulWidget {
  const TripPaymentMethodsScreen({super.key});
  static String path = '/trip-payment-methods';

  @override
  State<TripPaymentMethodsScreen> createState() =>
      _TripPaymentMethodsScreenState();
}

class _TripPaymentMethodsScreenState extends State<TripPaymentMethodsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
            horizontal: 20.w,
          ),
          child: BlocConsumer<PaymentCubit, PaymentsState>(
            listener: (context, state) {
              //Errors
              if (state is PaymentGetPaymentMethodsErrorState) {
                context.showSnackBar(
                  state.error,
                  duration: const Duration(seconds: 2),
                );
              }
              if (state is PaymentRemovePaymentMethodErrorState) {
                context.showSnackBar(
                  state.error,
                  duration: const Duration(seconds: 2),
                );
              }
              if (state is PaymentAddPaymentMethodErrorState) {
                context.showSnackBar(
                  state.error,
                  duration: const Duration(seconds: 2),
                );
              }

              //Success
              if (state is PaymentAddPaymentMethodSuccessState) {
                context.showSnackBar(
                  AppLocalizations.of(context).addedPaymentMethod,
                  duration: const Duration(seconds: 2),
                  color: Palette.primary,
                );
                context.read<PaymentCubit>().getPaymentMethods();
              }

              if (state is PaymentRemovePaymentMethodSuccessState) {
                context.showSnackBar(
                  AppLocalizations.of(context).paymentMethodRemoved,
                  duration: const Duration(seconds: 2),
                  color: Palette.primary,
                );
                context.read<PaymentCubit>().getPaymentMethods();
              }
            },
            builder: (context, state) {
              return state is PaymentGetPaymentMethodsInitialState ||
                      state is PaymentAddPaymentMethodInitialState ||
                      state is PaymentRemovePaymentMethodInitialState
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)
                                .loadingYourPaymentMethods,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).paymentMethods,
                          style: textTheme.title,
                        ),
                        10.h.vGap,
                        Text(
                          AppLocalizations.of(context).selectAPaymentMethod,
                          style: textTheme.body1,
                        ),
                        32.h.vGap,
                        if (state.methods.isNotEmpty)
                          ...state.methods.map(
                            (e) => PaymentCardWidget(
                              textTheme: textTheme,
                              title: e.name,
                              icon: e.icon,
                              onTap: () => _handleSelectedPayment(e),
                              isSelected: e.type == state.selected,
/*                               onLongPress: () => _handlePaymentMethodDelete(e),
 */
                            ),
                          ),
                        /*  5.h.vGap,
                  PaymentCardWidget(
                    textTheme: textTheme,
                    title: 'Visa Card',
                    icon: Constants.masterCardIcon,
                    isSelected: PaymentMethodsType.VISACARD == state.type,
                    onTap: () =>
                        _handlePaymentUpdate(PaymentMethodsType.VISACARD),
                  ), */
                        5.h.vGap,
                        PaymentMethodCardWidget(
                          textTheme: textTheme,
                          title: AppLocalizations.of(context).cash,
                          icon: Constants.cashIcon,
                          isSelected: PaymentMethodsType.CASH == state.selected,
                          onTap: _handleSelectCash,
                        ),
                        const Spacer(),
                        WakaluxeButton(
                          text: AppLocalizations.of(context).next,
                          action: _handleContinue,
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _handleContinue() async {
    await context.router.pushNamed(PaymentProcessingScreen.name);
  }

  void _handleSelectedPayment(MobilePaymentMethodModel method) {
    context.read<PaymentCubit>().updatePaymentMethod(method);
  }

  void _handleSelectCash() {
    context.read<PaymentCubit>().updatePaymentMethod(
          const MobilePaymentMethodModel(
            id: 'cash',
            name: 'Cash',
            icon: Constants.cashIcon,
            type: PaymentMethodType.CASH,
          ),
        );
  }
}
