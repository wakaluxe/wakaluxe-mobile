// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/edit_profile.dart'
    show EditProfile;
import 'package:wakaluxe/src/features/Profile/presentation/widgets/profile_box_widget.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/profile_button.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const WakaluxBackButton(),
        title: const Text(
          'Welcome!',
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => SizedBox(
          width: context.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              children: <Widget>[
                if (state is AuthChangeProfileImageInit ||
                    state is AuthGetUserInit)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                else
                  Hero(
                    tag: 'profile',
                    child: CircleAvatar(
                      radius: 100.w,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      backgroundImage: (state.user.profilePicture != null
                          ? NetworkImage(state.user.profilePicture!)
                          : const AssetImage(
                              Constants.profile,
                            )) as ImageProvider,
                    ),
                  ),
                10.h.vGap,
                Text(
                  state.user.fullName ?? "What's your name?",
                  style: context.theme.textTheme.title,
                ),
                4.h.vGap,
                Text(
                  state.user.phoneNumber!,
                  style: context.theme.textTheme.body1,
                ),
                4.h.vGap,
                4.h.vGap,
                Text('Subscription Plan', style: context.theme.textTheme.body1),
                35.h.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ProfileButton(
                      t: context.theme.textTheme,
                      title: 'Edit Profile',
                      onTap: () =>
                          context.router.pushNamed(EditProfile.routeName),
                    ),
                    20.w.hGap,
                    ProfileButton(
                      t: context.theme.textTheme,
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
                        t: context.theme.textTheme,
                        title: 'Ride Token',
                        value: '70',
                      ),
                      20.w.hGap,
                      ProfileBoxWidget(
                        t: context.theme.textTheme,
                        title: 'Rides Cancelled',
                        value: '10',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
