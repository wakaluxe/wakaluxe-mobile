import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/Communication/presentation/pages/message.dart';
import 'package:wakaluxe/src/features/Communication/presentation/pages/messages.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/create-new-password.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/forgot_password.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_profile.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_trip.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/notification.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/verify_password.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';

import 'package:wakaluxe/src/features/Profile/presentation/pages/security.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/settings.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: Welcome,
      initial: true,
      path: '/welcome',
    ),
    AutoRoute(
      page: ChooseLanguage,
      path: '/choose-language',
    ),
    AutoRoute(
      page: ChooseTheme,
      path: '/choose-theme',
    ),
    AutoRoute(
      page: MyTrip,
      path: '/my-trip',
    ),
    AutoRoute(
      page: Messages,
      path: '/messages',
    ),
    AutoRoute(
      page: Message,
      path: '/message/:id',
    ),
    AutoRoute(
      page: MyProfile,
      path: '/my-profile',
    ),
    AutoRoute(
      page: Notification,
      path: '/notifications',
    ),
    AutoRoute(
      page: Settings,
      path: '/settings',
    ),
    AutoRoute(
      page: Security,
      path: '/security',
    ),
    AutoRoute(
      page: VerifyPassword,
      path: '/verify-password',
    ),
    AutoRoute(
      page: ForgotPassword,
      path: '/forgot-password',
    ),
    AutoRoute(
      page: CreateNewPassword,
      path: '/create-new-password',
    ),
  ],
)
class $AppRouter {}
