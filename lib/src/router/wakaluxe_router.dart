// @AdaptiveAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[

//   ],
// )

import 'package:auto_route/auto_route.dart';

import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@AutoRouterConfig()
class WakaluxeRouter extends $WakaluxeRouter {
  @override
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
