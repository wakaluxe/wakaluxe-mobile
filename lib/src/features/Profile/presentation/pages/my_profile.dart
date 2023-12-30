// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/common/Utils/alerts.dart';
import 'package:wakaluxe/src/common/common.dart';

import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';
import 'package:wakaluxe/src/configs/palette.dart';
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogOutSuccess) {
            successToast(context, 'Logged Out Successfully');
            context.router.pop();
          }
          if (state is AuthLogOutError) {
            errorToast(context, state.error);
          }
        },
        builder: (context, state) => SizedBox(
          width: context.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              children: <Widget>[
                30.h.vGap,
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
                Text(
                  'No Subscription Plan',
                  style: context.theme.textTheme.body1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Palette.black,
                  ),
                ),
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
                const Spacer(),
                WakaluxeButton(
                  text: 'Edit Profile',
                  action: () => context.router.pushNamed(EditProfile.routeName),
                ),
                20.h.vGap,
                if (state is AuthLogOutInit)
                  WakaluxeButton(
                    text: 'See you soon!',
                    color: context.colorScheme.error.withOpacity(0.5),
                  )
                else
                  WakaluxeButton(
                    text: 'Log Out',
                    color: context.colorScheme.error,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleLogOut(BuildContext context) {
    context.read<AuthBloc>().add(OnLogOutRequestEvent());
  }
}
