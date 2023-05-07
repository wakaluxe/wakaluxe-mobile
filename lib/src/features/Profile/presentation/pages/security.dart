import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'Security')
class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
          style: theme.title,
        ),
      ),
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Remember Me',
                    style: theme.body1,
                  ),
                  const Spacer(),
                  Checkbox(value: true, onChanged: (val) {})
                ],
              ),
              28.vGap,
              GestureDetector(
                onTap: () => context.router.pushNamed('/forgot-password'),
                child: Row(
                  children: [
                    Text(
                      'Change Password',
                      style: theme.body1,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
