import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';

import 'package:wakaluxe/src/features/auth/presentation/presentation.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart';

import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart';

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
      page: Verification,
      path: '/verification',
    ),
    AutoRoute(
      page: PhoneNumber,
      path: '/phone-number',
    ),
    AutoRoute(
      page: Login,
      path: '/login',
    ),
    AutoRoute(
      page: SignUp,
      path: '/sign-up',
    ),
    AutoRoute(
      page: SubscriptionsPage,
      path: '/subscriptions',
    ),
    AutoRoute(
      page: SubscriptionDetailPage,
      path: '/subscription-detail',
    )
  ],
)
class $AppRouter {}
