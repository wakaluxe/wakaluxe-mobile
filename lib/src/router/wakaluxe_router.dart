import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_trip.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';

import '../features/Communication/presentation/pages/messages.dart';

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
      path: '/my-trip'
    ),
    AutoRoute(
      page: Messages,
      path: '/messages'
    ),
  ],
)
class $AppRouter {}
