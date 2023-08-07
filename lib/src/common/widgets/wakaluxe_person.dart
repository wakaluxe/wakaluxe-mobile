import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class WakaluxePerson extends StatelessWidget {
  const WakaluxePerson({
    required this.userImage,
    super.key,
  });
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WakaluxeProfileImage(
          imageUrl: userImage,
        ),
        Row(
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
        )
      ],
    );
  }
}
