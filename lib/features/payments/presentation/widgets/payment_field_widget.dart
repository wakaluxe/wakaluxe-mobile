
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

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
            vertical: 5.h,
          ),
        ),
      ),
    );
  }
}
