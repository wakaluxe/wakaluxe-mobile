import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class EmptyNotificationContent extends StatelessWidget {
  const EmptyNotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Image.asset(Constants.searchData),
        ],
      ),
    );
  }
}
// Compare this snippet from lib/src/features/Profile/presentation/pages/profile.dart: