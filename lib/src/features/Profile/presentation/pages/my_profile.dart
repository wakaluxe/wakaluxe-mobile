// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/l10n/l10n.dart';

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
        title: Text(
          AppLocalizations.of(context).welcome,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogOutSuccess) {
            successToast(
                context, AppLocalizations.of(context).authLogOutSuccess);
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
                ProfileTile(
                  title: state.user.fullName ??
                      AppLocalizations.of(context).profileNameTitle,
                  subtitle: AppLocalizations.of(context).name,
                ),
                4.h.vGap,
                ProfileTile(
                  title: state.user.phoneNumber!,
                  subtitle: AppLocalizations.of(context).phoneNumber,
                ),
                4.h.vGap,
                ProfileTile(
                  title: AppLocalizations.of(context).noSubscription,
                  subtitle: AppLocalizations.of(context).subscriptionPlan,
                ),
                35.h.vGap,
                /*        Row(
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
          */
                const Spacer(),
                WakaluxeButton(
                  text: AppLocalizations.of(context).editProfile,
                  action: () => context.router.pushNamed(EditProfile.routeName),
                ),
                10.h.vGap,
                WakaluxeButton(
                  text: AppLocalizations.of(context).changePlan,
                  action: () => _handleChangePlan(context),
                ),
                20.h.vGap,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleChangePlan(BuildContext context) {
    successToast(context, AppLocalizations.of(context).commingSoon);
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.title,
    required this.subtitle,
    super.key,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: context.theme.textTheme.title,
      ),
      subtitle: Text(
        subtitle,
        style: context.theme.textTheme.subtitle3,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
        onPressed:
            onTap ?? () => context.router.pushNamed(EditProfile.routeName),
      ),
    );
  }
}
