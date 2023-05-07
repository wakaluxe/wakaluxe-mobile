import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_dotted_line.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

import '../../configs/wakaluxe_icons.dart';

import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeTripDetails extends StatelessWidget {
  const WakaluxeTripDetails({
    required this.pickUpLocation,
    required this.dropOffLocation,
    super.key,
  });

  final String pickUpLocation;
  final String dropOffLocation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: context.scheme.primary,
            ),
            10.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup Location',
                  style: context.bodyLgBold,
                ),
                Text(
                  pickUpLocation,
                  style: context.bodySm,
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: CustomPaint(
            size: const Size(1, 50),
            painter: WakaluxeDottedLine(
              color: context.scheme.onBackground,
            ),
          ),
        ),
        2.vGap,
        Row(
          children: [
            Icon(
              WakaluxIcons.location,
              color: context.scheme.error,
            ),
            10.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stop Location',
                  style: context.bodyLgBold,
                ),
                Text(
                  dropOffLocation,
                  style: context.bodySm,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
