import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeOptionCard extends StatelessWidget {
  const WakaluxeOptionCard({
    required this.duration,
    required this.price,
    required this.isSelected,
    super.key,
  });
  final String duration;
  final String price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? context.scheme.tertiary
              : context.scheme.onBackground,
        ),
        borderRadius: BorderRadius.circular(10),
        // boxShadow: BoxShadow()
        
      ),
      width: context.width * 0.31,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(duration),
          5.vGap,
          Text(
            price,
            style: context.bodyLgBold,
          ),
          5.vGap,
          Text(
            'XAF',
            style: context.bodyLg,
          )
        ],
      ),
    );
  }
}
