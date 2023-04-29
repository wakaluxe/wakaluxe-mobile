import 'package:auto_route/auto_route.dart';
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
    AutoRoute(page: Home.page, initial: true, path: '/home'),
    AutoRoute(page: Verification.page, path: '/verification'),
    AutoRoute(page: SignUp.page, path: '/sign-up'),
    AutoRoute(page: PhoneNumber.page, path: '/phone-number'),
    AutoRoute(page: Login.page, path: '/login'),
    AutoRoute(page: Subscriptions.page, path: '/subscriptions'),
    AutoRoute(
        page: SubscriptionDetail.page, path: '/subscription-detail/:plan'),
  ];
}
