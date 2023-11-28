import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

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
        WakaluxeProfileImage(
          imageUrl: driverImage,
        ),
        5.hGap,
        Column(
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
                  color: context.colorScheme.tertiary,
                  size: 20,
                ),
                5.hGap,
                Text(
                  rating.toString(),
                  style: context.bodySm,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _handleMessageDriver(context),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: context.colorScheme.tertiaryContainer,
                child: Icon(
                  WakaluxIcons.message_outlined,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
            5.hGap,
            GestureDetector(
              //TODO: implement call driver
              onTap: () => _handleMessageDriver,

              child: CircleAvatar(
                radius: 25,
                backgroundColor: context.colorScheme.secondaryContainer,
                child: Icon(
                  WakaluxIcons.phone,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _handleMessageDriver(BuildContext context)async {
    final random = Random();
    final client = locator<StreamChatClient>();
    final channel = client.channel('messaging', id: 'driver-${random.nextInt(100)}');
   await channel.watch();
    await context.router.push(
      TripMessageView(channel: channel),
    );
  }
}
