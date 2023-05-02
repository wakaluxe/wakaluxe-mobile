import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'DriverLogin')
class DriverLogin extends StatelessWidget {
  const DriverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController();
    final controller2 = TextEditingController();
    final controller3 = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.vGap,
            Text(' Log in to your driver account', style: context.titleLgBold),
            20.vGap,
            WakaluxeFormField(
              hint: 'Email/Phone Number',
              controller: controller1,
            ),
            10.vGap,
            WakaluxeFormField(
              hint: 'Driver Id No',
              controller: controller2,
              prefixIcon: const Icon(Icons.ac_unit),
            ),
            10.vGap,
            WakaluxeFormField(
              hint: 'Enter Pin',
              controller: controller3,
              prefixIcon: const Icon(Icons.pin),
              sufixIcon: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.visibility),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WakaluxeFormField extends StatelessWidget {
  const WakaluxeFormField({
    required this.hint,
    super.key,
    this.controller,
    this.prefixIcon,
    this.sufixIcon,
    this.isObscured = false,
  });
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscured,
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
