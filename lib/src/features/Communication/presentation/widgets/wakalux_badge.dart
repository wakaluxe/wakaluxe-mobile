// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class WakaluxBadge extends StatelessWidget {
  final String value;
  const WakaluxBadge({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.scheme.primary,
      ),
      child: Center(
        child: Text(
          value,
          style: theme.button1,
        ),
      ),
    );
  }
}
