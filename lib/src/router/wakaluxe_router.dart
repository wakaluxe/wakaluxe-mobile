// @AdaptiveAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[

//   ],
// )

import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/auth/presentation/presentation.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart';

import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@AutoRouterConfig()
class WakaluxeRouter extends $WakaluxeRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: Welcome.page,
      path: '/welcome',
    ),
    AutoRoute(
      page: ChooseLanguage.page,
      path: '/choose-language',
    ),
    AutoRoute(
      page: ChooseTheme.page,
      path: '/choose-theme',
    ),
    AutoRoute(page: Home.page, initial: true, path: '/home')
  ];
}
