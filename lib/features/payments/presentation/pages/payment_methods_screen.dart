// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_information_screen.dart';
import 'package:wakaluxe/features/payments/presentation/widgets/payment_card_widget.dart';
import 'package:wakaluxe/src/common/Utils/enums.dart';
import 'package:wakaluxe/src/common/common.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage()
class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});
  static String path = '/payment-methods';

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
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
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  Text(
                    'Payment Methods',
                    style: textTheme.title,
                  ),
                  10.h.vGap,
                  Text(
                    'Select a preferred Payment method ',
                    style: textTheme.body1,
                  ),
                  32.h.vGap,
                  PaymentCardWidget(
                    textTheme: textTheme,
                    title: 'MTN Mobile Money',
                    icon: Constants.mtnMoneyIcon,
                    onTap: () =>
                        _handlePaymentUpdate(PaymentMethodsType.MTNMOMO),
                    isSelected: PaymentMethodsType.MTNMOMO == state.type,
                  ),
                  5.h.vGap,
                  PaymentCardWidget(
                    textTheme: textTheme,
                    title: 'Orange Mobile Money',
                    icon: Constants.orangeMoneyIcon,
                    isSelected: PaymentMethodsType.ORANGEMONEY == state.type,
                    onTap: () =>
                        _handlePaymentUpdate(PaymentMethodsType.ORANGEMONEY),
                  ),
                  5.h.vGap,
                  PaymentCardWidget(
                    textTheme: textTheme,
                    title: 'Visa Card',
                    icon: Constants.masterCardIcon,
                    isSelected: PaymentMethodsType.VISACARD == state.type,
                    onTap: () =>
                        _handlePaymentUpdate(PaymentMethodsType.VISACARD),
                  ),
                  5.h.vGap,
                  PaymentCardWidget(
                    textTheme: textTheme,
                    title: 'Cash',
                    isSelected: PaymentMethodsType.CASH == state.type,
                    onTap: () => _handlePaymentUpdate(PaymentMethodsType.CASH),
                  ),
                  const Spacer(),
                  WakaluxeButton(
                    text: 'Confirm',
                    action: () =>
                       _handleConfirmation(state.type),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleConfirmation(PaymentMethodsType type) {
    if (type == PaymentMethodsType.UNDEFINE) {
      context.showSnackBar(
        'Please select a payment method',
        duration: const Duration(seconds: 2),
      );
    } else{
      context.router.pushNamed(PaymentInformationScreen.name);
  }}

  void _handlePaymentUpdate(PaymentMethodsType type) {
    context.read<PaymentCubit>().updatePaymentMethod(type);
  }
}
