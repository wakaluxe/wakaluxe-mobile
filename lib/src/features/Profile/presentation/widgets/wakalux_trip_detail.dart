// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/common/widgets/wakaluxe_dotted_line.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeTripDetails extends StatelessWidget {
  const WakaluxeTripDetails({
    super.key,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.tripState,
  });

  final String pickUpLocation;
  final String dropOffLocation;
  final TripState tripState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Constants.nearbyIcon,
            ),
            10.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup Location',
                  style: theme.label,
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
            SvgPicture.asset(Constants.markerIcon),
            10.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stop Location',
                  style: theme.label,
                ),
                Text(
                  dropOffLocation,
                  style: context.bodySm,
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 21.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: context.scheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(tripState.name,
                  style:
                      theme.subtitle.copyWith(color: context.scheme.tertiary)),
            ),
          ],
        ),
      ],
    );
  }
}
