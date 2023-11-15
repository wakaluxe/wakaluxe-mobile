// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_methods_screen.dart';
import 'package:wakaluxe/src/common/Utils/alerts.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/auth_source_route.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/home_box.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/home_card.dart';
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
    context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          GestureDetector(
            onTap: () {
              context.router.pushNamed('/notifications');
            },
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
                    onTap: () {
                      context.router.push(const MyProfile());
                    },
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
                      if (state is AuthLogOutError) {
                        context.showSnackBar(
                          state.error,
                          color: context.colorScheme.error,
                        );
                        if (state is AuthLogOutSuccess) {
                          context.router.pushAndPopUntil(
                            SignUp(
                              route: AuthSourceRoute.home,
                            ),
                            predicate: (route) => false,
                          );
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state.user.hasId == false) {
                        return HomeBox(
                          t: t,
                          title: 'Log In',
                          icon: Constants.logoutIcon,
                          onTap: () =>
                              //  logDebug('user ${state.user.toJson()}'),
                              context.router.pushNamed('/sign-up'),
                        );
                      }
                      if (state is AuthLogOutInit) {
                        return HomeBox(
                          t: t,
                          onTap: () {},
                          title: 'Please wait...',
                          icon: Constants.logoutIcon,
                          //onTap: _handleLogOutRequest,
                        );
                      }
                      return BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthLogOutSuccess) {
                            successToast(context, 'Logged out successfully!');
                          }
                          if (state is AuthLogOutError) {
                            errorToast(context, state.error);
                          }
                        },
                        child: HomeBox(
                          t: t,
                          title: 'Log Out',
                          icon: Constants.logoutIcon,
                          onTap: _handleLogOutRequest,
                        ),
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
            Row(
              children: <Widget>[
                HomeCard(
                  image: Constants.onBoard2,
                  title: 'Book a Taxi',
                  t: t,
                  onTap: () => context.router.pushNamed('/home-map'),
                ),
                10.w.hGap,
                HomeCard(
                  title: 'Rent a Car',
                  t: t,
                  image: Constants.onBoard1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
