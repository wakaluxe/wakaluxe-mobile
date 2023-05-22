import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

import 'auth_guard.dart';

@AutoRouterConfig()
class WakaluxAppRouter extends $WakaluxAppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: Welcome.page,  path: '/welcome', initial: true),
        AutoRoute(page: Home.page,  path: '/home'),
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
        AutoRoute(page: DailyObjectives.page, path: '/daily_objectices/:carId'),
        AutoRoute(page: DriverLogin.page, path: '/driver_login'),
        AutoRoute(page: DriverHome.page, path: '/driver_home'),
        AutoRoute(
          page: MyTrip.page,
          path: '/my-trip',
        ),
        AutoRoute(
          page: Messages.page,
          path: '/messages',
        ),
        AutoRoute(
          page: Message.page,
          path: '/message/:id',
        ),
        AutoRoute(
          page: MyProfile.page,
          path: '/my-profile',
        ),
        AutoRoute(
          page: Notification.page,
          path: '/notifications',
        ),
        AutoRoute(
          page: Settings.page,
          path: '/settings',
        ),
        AutoRoute(
          page: Security.page,
          path: '/security',
        ),
        AutoRoute(
          page: VerifyPassword.page,
          path: '/verify-password',
        ),
        AutoRoute(
          page: ForgotPassword.page,
          path: '/forgot-password',
        ),
        AutoRoute(
          page: CreateNewPassword.page,
          path: '/create-new-password',
        ),
        AutoRoute(
          page: Language.page,
          path: '/language',
        ),
      ];
}
