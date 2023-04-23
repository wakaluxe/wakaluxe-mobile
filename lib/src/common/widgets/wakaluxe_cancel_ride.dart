import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_dotted_line.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_driver.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeCancleRide extends StatelessWidget {
  const WakaluxeCancleRide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ariving in 2 mins',
                style: context.bodyLgBold,
              ),
              Text(
                'Driver Details',
                style: context.bodyLgBold,
              ),
            ],
          ),
          10.vGap,
          Divider(
            color: context.scheme.onBackground,
            // .withOpacity(0.6),
            thickness: 0.4,
          ),
          10.vGap,
          const WakaluxeDriver(
            driverImage: 'https://placeimg.com/640/480/any',
            driverName: 'Ayuko Peters',
            rating: 2.0,
          ),
          10.vGap,
          Divider(
            color: context.scheme.onBackground,
            // .withOpacity(0.6),
            thickness: 0.4,
          ),
          10.vGap,
          Text('Your Trip', style: context.bodyLgBold),
          Column(
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
                        'Messasi Zouatoupsi',
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
                        'Round point Nlonkak',
                        style: context.bodySm,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          10.vGap,
          Divider(
            color: context.scheme.onBackground,
            // .withOpacity(0.6),
            thickness: 0.4,
          ),
          10.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment', style: context.bodyLgBold),
              Text('change', style: context.bodyLgBold),
            ],
          ),
          10.vGap,
          Row(
            children: [
              Icon(
                Icons.credit_card,
                color: context.scheme.onBackground,
              ),
              10.hGap,
              Text(
                'MTN Mobile Money',
                style: context.bodyMdBold,
              ),
              const Spacer(),
              Text(
                '500XAF',
                style: context.bodyMdBold,
              )
            ],
          ),
          25.vGap,
          WakaluxeButton(
            text: 'Cancel Ride',
            color: context.scheme.errorContainer,
            textColor: context.scheme.error,
            action: () {},
          )
        ],
      ),
    );
  }
}
