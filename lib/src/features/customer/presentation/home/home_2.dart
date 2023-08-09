// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_methods_screen.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/home_box.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/promotion_banner.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@RoutePage(name: 'Home_2')
class Home2Screen extends StatefulWidget {
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  void _handleLogOutRequest() {
    context.read<AuthBloc>().add(OnLogOutRequestEvent());
  }

  @override
  void initState() {
    context.read<AuthBloc>().add(OnAppStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0.w),
        child: Column(
          children: <Widget>[
            24.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.pushNamed('/notifications');
                  },
                  child: SvgPicture.asset(Constants.notificationIcon),
                ),
              ],
            ),
            const PromotionBanner(),
            24.vGap,
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
                      onTap: () => context.router.pushNamed('/my-profile'),
                    ),
                    HomeBox(
                      t: t,
                      title: 'Chat',
                      icon: Constants.messageIcon,
                      onTap: () => context.router.pushNamed('/messages'),
                    ),
                    HomeBox(
                      t: t,
                      title: 'Settings',
                      icon: Constants.settingIcon,
                      onTap: () => context.router.pushNamed('/settings'),
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is AuthLogOutError) {
                          context.showSnackBar(
                            state.error,
                            color: context.colorScheme.error,
                          );
                          if (state is AuthLogOutSuccess) {
                            context.router.pushAndPopUntil(
                              const SignUp(),
                              predicate: (route) => false,
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLogOutInit) {
                          return HomeBox(
                            t: t,
                            onTap: () {},
                            title: 'Please wait...',
                            icon: Constants.logoutIcon,
                            //onTap: _handleLogOutRequest,
                          );
                        }
                        return HomeBox(
                          t: t,
                          title: 'Log Out',
                          icon: Constants.logoutIcon,
                          onTap: () {},
                        );
                      },
                    ),
                    HomeBox(
                      t: t,
                      title: 'Subscriptions',
                      icon: Constants.walletIcon,
                      onTap: () => context.router.pushNamed('/subscriptions'),
                    ),
                    HomeBox(
                      t: t,
                      title: 'Payment',
                      icon: Constants.subscriptionIcon,
                      onTap: () =>
                          context.router.pushNamed(PaymentMethodsScreen.path),
                    ),
                    HomeBox(
                      t: t,
                      title: 'My Trips',
                      icon: Constants.locationIcon,
                      onTap: () => context.router.pushNamed('/my-trip'),
                    ),
                    HomeBox(
                      t: t,
                      title: 'Support',
                      icon: Constants.headphoneIcon,
                      onTap: () => context.router.pushNamed('/settings'),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                HomeCard(
                  title: 'Book a Taxi',
                  t: t,
                  onTap: () => context.router.pushNamed('/home-map'),
                ),
                10.w.hGap,
                HomeCard(title: 'Rent a Car', t: t),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.t,
    required this.title,
    super.key,
    this.onTap,
  });

  final TextTheme t;
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 173.h,
        width: 178.w,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
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
