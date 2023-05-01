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
      page: SubscriptionDetail.page,
      path: '/subscription-detail/:plan',
    ),
    AutoRoute(
      page: PaymentDetails.page,
      path: '/payment-details',
    ),
    AutoRoute(
      page: Rating.page,
      path: '/rating',
    ),
    AutoRoute(
      page: RentACar.page,
      path: '/rent-a-car',
    ),
    AutoRoute(
      page: AvailableCar.page,
      path: '/available-cars',
    ),
    AutoRoute(
      page: ViewCar.page,
      path: '/view-car',
    ),
    AutoRoute(page: MyGarage.page, path: '/my_garage'),
    AutoRoute(page: ViewInGarage.page, path: '/view_in_garage/:carId'),
    AutoRoute(page: StatusReport.page, path: '/status_report/:carId'),
    AutoRoute(
      page: MaintainanceReport.page,
      path: '/maintainance_report/:carId',
    ),
    AutoRoute(page: DailyObjectives.page, path: '/daily_objectices/:carId')
  ];
}
