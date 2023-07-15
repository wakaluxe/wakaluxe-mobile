// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/home_box.dart';

import '../../../../configs/wakaluxe_constants.dart';

@RoutePage(name: 'Home_2')
class Home2Screen extends StatelessWidget {
  const Home2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          actions: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(Constants.notificationIcon),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(19.0.w),
          child: Column(
            children: <Widget>[
              Text(
                'Hi! Welcome to Wakalux',
                style: t.title,
              ),
              40.h.vGap,
              SizedBox(
                height: 230.h,
                child: Expanded(
                  child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      children: [
                        HomeBox(
                            t: t,
                            title: 'My Profile',
                            icon: Constants.profileIcon,
                            onTap: () => context.router.pushNamed('/my-Profile')),
                        HomeBox(
                            t: t,
                            title: 'Chat',
                            icon: Constants.messageIcon,
                            onTap: () => context.router.pushNamed('/my-Profile')),
                        HomeBox(
                            t: t,
                            title: 'Settings',
                            icon: Constants.settingIcon,
                            onTap: () => context.router.pushNamed('/my-Profile')),
                        HomeBox(
                            t: t,
                            title: 'Log Out',
                            icon: Constants.logoutIcon,
                            onTap: () => context.router.pushNamed('/sign-up')),
                        HomeBox(
                            t: t,
                            title: 'Subscriptions',
                            icon: Constants.walletIcon,
                            onTap: () =>
                                context.router.pushNamed('/subscriptions')),
                        HomeBox(
                            t: t,
                            title: 'Payment',
                            icon: Constants.subscriptionIcon,
                            onTap: () => context.router.pushNamed('/my-Profile')),
                        HomeBox(
                            t: t,
                            title: 'My Trips',
                            icon: Constants.locationIcon,
                            onTap: () => context.router.pushNamed('/my-trip')),
                        HomeBox(
                            t: t,
                            title: 'Support',
                            icon: Constants.headphoneIcon,
                            onTap: () => context.router.pushNamed('/settings')),
                      ]),
                ),
              ),
              Row(
                children: <Widget>[
                  HomeCard(
                    title: 'Book a Taxi',
                    t: t,
                    onTap: () => context.router.pushNamed('/sign-up'),
                  ),
                  10.w.hGap,
                  HomeCard(
                    title: 'Rent a Car',
                    t: t),
                ],
              ),
            ],
          ),
        ));
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.t,
    this.onTap,
    required this.title,
  }) : super(key: key);

  final TextTheme t;
  final void Function()? onTap;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 173.h,
        width: 178.w,
        decoration: BoxDecoration(
          color: context.scheme.surfaceVariant,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(Constants.bookAsset),
            12.h.vGap,
            Text(
              title,
              style: t.body2,
            ),
          ],
        ),
      ),
    );
  }
}
