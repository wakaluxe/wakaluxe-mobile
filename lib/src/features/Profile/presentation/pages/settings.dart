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
              child: SettingTile(title: 'Language', theme: theme),
            ),
            SizedBox(height: 20.h),
            SettingTile(
              theme: theme,
              title: 'Turn Location on/off',
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                context.router.pushNamed('/security');
              },
              child: SettingTile(title: 'Security', theme: theme),
            ),
            SizedBox(height: 20.h),
            SettingTile(title: 'Terms & Privacy', theme: theme),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.theme,
    required this.title,
  });

  final TextTheme theme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: theme.body1),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16.sp,
      ),
    );
  }
}
