import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxePropertyCard extends StatelessWidget {
  const WakaluxePropertyCard({
    required this.propertyName,
    required this.propertyValue,
    super.key,
  });
  final String propertyName;
  final String propertyValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 20,
        // bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            propertyName,
            style: context.bodyLg.copyWith(
              color: context.colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
          2.vGap,
          Text(
            propertyValue,
            style: context.bodyLgBold,
          )
        ],
      ),
    );
  }
}
