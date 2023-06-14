// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart' as routes;

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Constants.closeIcon),
              20.vGap,
              const CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage(Constants.profile),
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: context.scheme.tertiary,
                tabs: const [
                  Tab(
                    text: 'Taxi Booking',
                  ),
                  Tab(
                    text: 'Car Rentals',
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0.w),
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      TaxiBookingContent(),
                      Column(
                        children: [
                          ListTile(
                            title: Text('Rentals'),
                            leading: Icon(Icons.location_on),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaxiBookingContent extends StatelessWidget {
  const TaxiBookingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        44.vGap,
        GestureDetector(
          onTap: () => context.pushRoute(const routes.MyTrip()),
          child: const TaxiBookingLabels(
            title: 'My trips',
            icon: Constants.locationIcon,
          ),
        ),
        30.vGap,
        GestureDetector(
          onTap: () => context.pushRoute(const routes.Messages()),
          child: const TaxiBookingLabels(
            title: 'Messages',
            icon: Constants.messageIcon,
          ),
        ),
        30.vGap,
        const TaxiBookingLabels(
          title: 'Support',
          icon: Constants.headphoneIcon,
        ),
        30.vGap,
        GestureDetector(
          onTap: () => context.pushRoute(const routes.Settings()),
          child: const TaxiBookingLabels(
            title: 'Settings',
            icon: Constants.settingIcon,
          ),
        )
      ],
    );
  }
}

class TaxiBookingLabels extends StatelessWidget {
  const TaxiBookingLabels({
    required this.title,
    required this.icon,
    super.key,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        SvgPicture.asset(icon),
        16.hGap,
        Text(
          title,
          style: theme.body1,
        )
      ],
    );
  }
}
