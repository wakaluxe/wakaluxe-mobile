import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Communication/presentation/widgets/wakalux_badge.dart';

class MessagesContent extends StatelessWidget {
  const MessagesContent({super.key});

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
            leading: CircleAvatar(
              radius: 30.r,
              backgroundImage: const AssetImage(Constants.chat),
            ),
            title: Text(
              'John Doe',
              style: theme.subHeading1,
            ),
            subtitle: Text(
              'Hello, how are you?',
              style: theme.body2,
            ),
            trailing: const WakaluxBadge(
              value: '3',
            ),
          ),
        ),
      ),
    );
  }
}
