import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';

import 'package:wakaluxe/src/configs/configs.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxInputField extends StatelessWidget {
  const WakaluxInputField({
    super.key,
    required this.text,
    required this.hint,
    required this.controller,
    required this.icon,
    this.suffix,
    this.validator,
    this.obscured = false,
    this.formatter,
  });

  final TextTheme text;
  final String hint;
  final TextEditingController controller;
  final String icon;
  final String? suffix;
  final String? Function(String?)? validator;
  final bool obscured;
  final List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.scheme.primaryContainer.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 2.r, color: Palette.black.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFormField(
              validator: validator,
              obscureText: obscured,
              inputFormatters: formatter,
              decoration: InputDecoration(
                labelText: hint,
                icon: SvgPicture.asset(
                  icon,
                ),
                labelStyle: text.body1,
                border: InputBorder.none,
              ),
            ),
          ),
          if (suffix != null) SvgPicture.asset(suffix!)
        ],
      ),
    );
  }
}
