import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeBookingDetails extends StatelessWidget {
  const WakaluxeBookingDetails({
    required this.driverImage,
    required this.driverName,
    required this.rating,
    required this.imageLiknks,
    required this.recommended,
    required this.distance,
    required this.time,
    required this.price,
    required this.action,
    super.key,
  });

  final String driverImage;
  final String driverName;
  final num rating;
  final List<String> imageLiknks;
  final int recommended;
  final String distance;
  final String time;
  final String price;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: WakaluxeDriver(
            driverImage: driverImage,
            driverName: driverName,
            rating: rating,
          ),
        ),
        5.vGap,
        Divider(
          color: context.scheme.onBackground,
          // .withOpacity(0.6),
          thickness: 0.4,
        ),
        5.vGap,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              FlutterImageStack(
                imageList: imageLiknks,
                totalCount: 4,
                itemRadius: 40,
                showTotalCount: false,
              ),
              10.hGap,
              Text('$recommended Recommended'),
            ],
          ),
        ),
        5.vGap,
        Divider(
          color: context.scheme.onBackground,
          // .withOpacity(0.6),
          thickness: 0.4,
        ),
        5.vGap,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Icon(
                Icons.directions_car,
                color: context.scheme.onBackground,
                size: 50,
              ),
              10.hGap,
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'DISTANCE',
                      style: context.bodySm,
                    ),
                    5.vGap,
                    Text(
                      '$distance Km',
                      style: context.bodySm,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'TIME',
                      style: context.bodySm,
                    ),
                    5.vGap,
                    Text(
                      '$time Km',
                      style: context.bodySm,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'PRICE',
                      style: context.bodySm,
                    ),
                    5.vGap,
                    Text(
                      '$price XAF',
                      style: context.bodySm,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        20.vGap,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: WakaluxeButton(
            text: 'Confirm',
            action: action,
            color: context.scheme.tertiary,
            textColor: context.scheme.onTertiary,
          ),
        )
      ],
    );
  }
}
