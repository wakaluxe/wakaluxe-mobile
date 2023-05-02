import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxeDriver extends StatelessWidget {
  const WakaluxeDriver({
    required this.driverImage,
    required this.driverName,
    required this.rating,
    super.key,
  });

  final String driverImage;
  final String driverName;
  final num? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WakaluxeProfileImage(
            imageUrl: driverImage,
          ),
        ),
        5.hGap,
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driverName,
                style: context.titleLgBold,
              ),
              Row(
                children: [
                  Icon(
                    WakaluxIcons.star,
                    color: context.scheme.tertiary,
                    size: 20,
                  ),
                  5.hGap,
                  Text(
                    rating.toString(),
                    style: context.bodySm,
                  ),
                ],
              )
            ],
          ),
        ),
        5.hGap,
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: context.scheme.tertiaryContainer,
                child: Icon(
                  WakaluxIcons.message_outlined,
                  color: context.scheme.onBackground,
                ),
              ),
              5.hGap,
              CircleAvatar(
                radius: 25,
                backgroundColor: context.scheme.secondaryContainer,
                child: Icon(
                  WakaluxIcons.phone,
                  color: context.scheme.onBackground,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
