// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/common/Utils/helpers.dart';

import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class PaymentInformationScreen extends StatefulWidget {
  const PaymentInformationScreen({Key? key}) : super(key: key);

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
        leading: WakaluxBackhButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50.h,
          horizontal: 20.w,
        ),
        child: Form(
          key: _formKey,
          child: Column(
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
              8.h.vGap,
              PaymentFieldWidget(
                controller: _accountNumberController,
                hint: 'Enter your phone number',
                validator: phoneNumberValidator,
                
              ),
              15.h.vGap,
              Text('Taxi fare(XAF)', style: textTheme.body2),
              PaymentFieldWidget(hint: '500', controller: _amountController),
              111.h.vGap,
              GestureDetector(
                onTap: _handleConfirmation,
                child: WakaluxeButton(
                  text: 'Pay',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleConfirmation() {
    if (_formKey.currentState!.validate()) {
      context.showSnackBar(
        'Payment successful',
        duration: const Duration(seconds: 2),
      );
    }
  }
}

class PaymentFieldWidget extends StatelessWidget {
  const PaymentFieldWidget({
    Key? key,
    required this.hint,
    required this.controller,
    this.validator,
    this.formatters,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: context.scheme.outline),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextFormField(
        validator: validator,
        keyboardType: TextInputType.number,
        inputFormatters: formatters,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
        ),
      ),
    );
  }
}
