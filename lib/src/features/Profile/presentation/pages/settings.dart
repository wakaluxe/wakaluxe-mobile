import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';

@RoutePage()
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Settings',
          style: theme.title,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 30.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.router.pushNamed('/language');
              },
              child: Text('Language', style: theme.body1),
            ),
            SizedBox(height: 20.h),
            Text('Turn Location on/off', style: theme.body1),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                context.router.pushNamed('/security');
              },
              child: Text('Security', style: theme.body1),
            ),
            SizedBox(height: 20.h),
            Text('Terms & Privacy', style: theme.body1),
          ],
        ),
      ),
    );
  }
}
