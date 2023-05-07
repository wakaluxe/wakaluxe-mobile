import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxeFormField extends StatelessWidget {
  const WakaluxeFormField({
    required this.hint,
    super.key,
    this.controller,
    this.prefixIcon,
    this.sufixIcon,
    this.isObscured = true,
    this.isPassword = false,
    this.onChanged,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool isObscured;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final TextInputType? keyboardType;
  // final Callva

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && isObscured,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        focusColor: context.scheme.onBackground,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: context.scheme.onBackground.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: context.scheme.onBackground.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
