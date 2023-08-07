import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class CallsContent extends StatelessWidget {
  const CallsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: 36.h),
      child: Expanded(
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (context, index) => 24.vGap,
          itemBuilder: (context, index) => ListTile(
            onTap: () => context.router.pushNamed('/message/1'),
            leading: Hero(
              tag: 'chat',
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage(Constants.chat),
              ),
            ),
            title: Text(
              'Driver/client Name',
              style: theme.subHeading1,
            ),
            trailing: SvgPicture.asset(Constants.callIcon),
          ),
        ),
      ),
    );
  }
}
