import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_dotted_line.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: context.colorScheme.primary,
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
              color: context.colorScheme.onBackground,
            ),
          ),
        ),
        2.vGap,
        Row(
          children: [
            SvgPicture.asset(
              Constants.locationIcon,
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
