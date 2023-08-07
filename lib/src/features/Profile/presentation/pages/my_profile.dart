// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/edit_profile.dart' show EditProfile;
import 'package:wakaluxe/src/features/Profile/presentation/widgets/profile_box_widget.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/profile_button.dart';

@RoutePage()
class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const WakaluxBackButton(),
        title: Text(
          'Welcome!',
        ),
      ),
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'profile',
                child: CircleAvatar(
                  radius: 100.w,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundImage: AssetImage(Constants.profile),
                ),
              ),
              10.h.vGap,
              Text(
                'Ngome James',
                style: t.title,
              ),
              4.h.vGap,
              Text(
                '+237612345678',
                style: t.body1,
              ),
              4.h.vGap,
              Text(
                'customer@gmail.com',
                style: t.body1,
              ),
              4.h.vGap,
              Text('Subscription Plan', style: t.body1),
              35.h.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ProfileButton(
                    t: t,
                    title: 'Edit Profile',
                    onTap: () =>
                        context.router.pushNamed(EditProfile.routeName),
                  ),
                  20.w.hGap,
                  ProfileButton(
                    t: t,
                    title: 'Change Plan',
                    onTap: () {},
                  ),
                ],
              ),
              34.h.vGap,
              SizedBox(
                height: 120.h,
                child: Row(
                  children: <Widget>[
                    ProfileBoxWidget(
                      t: t,
                      title: 'Ride Token',
                      value: '70',
                    ),
                    20.w.hGap,
                    ProfileBoxWidget(
                      t: t,
                      title: 'Rides Cancelled',
                      value: '10',
                    ),
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
