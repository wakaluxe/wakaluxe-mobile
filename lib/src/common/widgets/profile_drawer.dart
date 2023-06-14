import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/widgets/menu_drawer.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';

import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Constants.closeIcon),
              20.vGap,
              ListTile(
                title: Text(
                  'Name of Driver',
                  style: theme.subHeading1,
                ),
                subtitle: Text(
                  '+237690596605',
                  style: theme.body2,
                ),
                trailing: const Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    radius: 34,
                    backgroundImage: AssetImage(Constants.profile),
                  ),
                ),
              ),
              40.vGap,
              GestureDetector(
                onTap: () => context.pushRoute(const MyProfile()),
                child: const TaxiBookingLabels(
                  title: 'My Profile',
                  icon: Constants.profileIcon,
                ),
              ),
              30.vGap,
              GestureDetector(
                onTap: () => context.router.pushNamed('/notifications'),
                child: const TaxiBookingLabels(
                  title: 'Notifications',
                  icon: Constants.notificationIcon,
                ),
              ),
              30.vGap,
              const TaxiBookingLabels(
                title: 'Subscription plan',
                icon: Constants.subscriptionIcon,
              ),
              30.vGap,
              const TaxiBookingLabels(
                title: 'Payment methods',
                icon: Constants.walletIcon,
              ),
              350.vGap,
              GestureDetector(
                onTap: () => context.router.pushNamed('/login'),
                child: const TaxiBookingLabels(
                  title: 'Log Out',
                  icon: Constants.logoutIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showProfileDialog() {}
