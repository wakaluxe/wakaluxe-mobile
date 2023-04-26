import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/auth/presentation/presentation.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: WakaluxeWelcome,
      initial: true,
      path: '/welcome',
    ),
    AutoRoute(
      page: WakaluxeChooseLanguage,
      path: '/choose-language',
    ),
    AutoRoute(
      page: WakaluxeChooseTheme,
      path: '/choose-theme',
    ),
    AutoRoute(
      page: WakaluxeVerification,
      path: '/verification',
    ),
    AutoRoute(
      page: WakaluxePhoneNumber,
      path: '/phone-number',
    ),
    AutoRoute(
      page: WakaluxeLogin,
      path: '/login',
    ),
    AutoRoute(
      page: WakaluxeSignUp,
      path: '/sign-up',
    ),
    AutoRoute(
      page: WakaluxeSubscriptions,
      path: '/subscriptions',
    ),
    AutoRoute(
      page: WakaluxeSubscriptionDetail,
      path: '/subscription-detail/:plan',
    )
  ],
)
class $AppRouter {}
