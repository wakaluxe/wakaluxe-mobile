// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxInputField extends StatefulWidget {
  const WakaluxInputField({
    super.key,
    required this.text,
    required this.hint,
    this.controller,
    this.icon,
    this.suffix,
    this.validator,
    this.obscured = false,
    this.formatter,
    this.radius,
    this.keyboardType,
  });

  final TextTheme text;
  final String hint;
  final TextEditingController? controller;
  final String? icon;
  final String? suffix;
  final String? Function(String?)? validator;
  final bool obscured;
  final List<TextInputFormatter>? formatter;
  final double? radius;
  final TextInputType? keyboardType;

  @override
  State<WakaluxInputField> createState() => _WakaluxInputFieldState();
}

class _WakaluxInputFieldState extends State<WakaluxInputField> {
  bool mask = false;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.obscured) {
      mask = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withOpacity(0.05),
        borderRadius: BorderRadius.circular(widget.radius ?? 20.r),
        border: Border.all(
          width: 2.r,
          color: context.colorScheme.scrim.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFormField(
              validator: widget.validator,
              obscureText: mask,
              controller: widget.controller,
              inputFormatters: widget.formatter,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: widget.hint,
                icon: widget.icon != null
                    ? SvgPicture.asset(
                        widget.icon!,
                      )
                    : null,
                hintStyle: widget.text.body1,
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.obscured)
            GestureDetector(
              onTap: () {
                setState(() {
                  mask = !mask;
                });
              },
              child: SvgPicture.asset(
                mask ? Constants.showIcon : Constants.hideIcon,
              ),
            ),
          if (widget.suffix != null) SvgPicture.asset(widget.suffix!)
        ],
      ),
    );
  }
}
