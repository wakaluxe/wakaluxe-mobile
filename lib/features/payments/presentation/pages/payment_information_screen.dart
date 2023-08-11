// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_processing_screen.dart';
import 'package:wakaluxe/features/payments/presentation/widgets/payment_field_widget.dart';
import 'package:wakaluxe/src/common/Utils/helpers.dart';

import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage()
class PaymentInformationScreen extends StatefulWidget {
  const PaymentInformationScreen({super.key});
  static String name = '/payment-information';
  @override
  State<PaymentInformationScreen> createState() =>
      _PaymentInformationScreenState();
}

class _PaymentInformationScreenState extends State<PaymentInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _accountNumberController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _accountNumberController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const WakaluxBackhButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.h,
            horizontal: 20.w,
          ),
          child: Form(
            key: _formKey,
            child: BlocListener<PaymentCubit, PaymentsState>(
              listener: (context, state) {
                _handleConfirmation();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Payment Details',
                    style: textTheme.title,
                  ),
                  34.h.vGap,
                  Text(
                    'Customer number',
                    style: textTheme.body2,
                  ),
                  10.h.vGap,
                  PaymentFieldWidget(
                    controller: _accountNumberController,
                    hint: 'Enter your phone number',
                    validator: phoneNumberValidator,
                    formatters: [phoneFormatter],
                  ),
                  30.h.vGap,
                  Text('Taxi fare(XAF)', style: textTheme.body2),
                  10.h.vGap,
                  PaymentFieldWidget(
                    hint: '500',
                    controller: _amountController,
                    validator: requireValidator,
                  ),
                  111.h.vGap,
                  GestureDetector(
                    onTap: _handleConfirmation,
                    child: WakaluxeButton(
                        text: 'Pay',
                        action: () {
                              context.read<PaymentCubit>().paymentProcessing();
      
                          context.read<PaymentCubit>().addPaymentInformation(
                              amount: _amountController.text,
                              number: _accountNumberController.text);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleConfirmation() {
    if (!_formKey.currentState!.validate()) {
      context.showSnackBar(
        'Please enter a valid information',
        duration: const Duration(seconds: 2),
      );
    } else {
      context.router.pushNamed(PaymentProcessingScreen.name);
    }
  }
}
