import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxeTextArea extends StatelessWidget {
  const WakaluxeTextArea({
    required this.hintText,
    this.textController,
    this.maxLines = 5,
    super.key,
  });
  final int maxLines;
  final String hintText;
  final TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.bodyMd,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
