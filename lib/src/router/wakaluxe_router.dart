import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';

import '../features/auth/presentation/presentation.dart';

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
  ],
)
class $AppRouter {}
