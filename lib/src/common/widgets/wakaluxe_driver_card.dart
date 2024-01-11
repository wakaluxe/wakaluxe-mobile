import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
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
    required this.phoneNumber,
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
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: WakaluxeDriver(
            driverImage: driverImage,
            driverName: driverName,
            phoneNumber: phoneNumber,
            rating: rating,
          ),
        ),
        3.vGap,
        3.vGap,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Icon(
                Icons.directions_car,
                color: context.colorScheme.onBackground,
                size: 50,
              ),
              10.hGap,
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context).distance,
                      style: context.bodySm,
                    ),
                    5.vGap,
                    Text(
                      distance,
                      style: context.bodySm,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context).time,
                      style: context.bodySm,
                    ),
                    5.vGap,
                    Text(
                      time,
                      style: context.bodySm,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context).price,
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
        10.vGap,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: TextButton(
            onPressed: action,
            style: TextButton.styleFrom(
              fixedSize: Size(
                0.8.sw,
                50,
              ),
              backgroundColor: context.colorScheme.tertiary,
            ),
            child: Text(
              AppLocalizations.of(context).confirm,
              style: Theme.of(context)
                  .textTheme
                  .button1
                  .copyWith(color: context.colorScheme.onSecondary),
            ),
            /*    color: ,
            textColor: context.colorScheme.onTertiary, */
          ),
        )
      ],
    );
  }
}
