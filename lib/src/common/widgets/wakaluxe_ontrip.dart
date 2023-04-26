import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeOnTrip extends StatelessWidget {
  const WakaluxeOnTrip({
    required this.driverName,
    required this.driverImage,
    required this.rating,
    super.key,
  });
  final String driverName;
  final String driverImage;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'On Trip',
            style: context.bodyLgBold,
          ),
          5.vGap,
          Divider(
            color: context.scheme.onBackground,
            // .withOpacity(0.6),
            thickness: 0.4,
          ),
          5.vGap,
          WakaluxeDriver(
            driverImage: driverImage,
            driverName: driverName,
            rating: rating,
          ),
          20.vGap
        ],
      ),
    );
  }
}
