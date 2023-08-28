import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/router/auth_guard.dart';
import 'package:wakaluxe/src/router/onboarding_guard.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

@AutoRouterConfig()
class WakaluxAppRouter extends $WakaluxAppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: Welcome.page,
          path: '/welcome',
          initial: true,
          guards: [
            OnBoardingGuard(),
          ],
        ),
        // AutoRoute(page: Home.page, path: '/home', guards: [AuthGuard()]),
        AutoRoute(page: HomeMap.page, path: '/home-map',guards:[AuthGuard()]),
        AutoRoute(page: Login.page, path: '/login'),
        AutoRoute(page: Verification.page, path: '/verification'),
        AutoRoute(page: SignUp.page, path: '/sign-up'),
        // AutoRoute(page: PhoneNumber.page, path: '/phone-number'),
        AutoRoute(page: PhoneSignUp.page, path: '/phone-sign-up'),
        AutoRoute(page: WakaluxeCreatePin.page, path: '/create-pin'),
        AutoRoute(page: EnterFullName.page, path: '/enter-full-name'),

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
          page: EditProfile.page,
          path: '/edit-profile',
        ),
        AutoRoute(
          page: Home_2.page,
          path: '/home-2',
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
          guards: [AuthGuard()],
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
          // ignore: avoid_dynamic_calls
          page: CreateNewPassword.page,
          path: '/create-new-password',
        ),
        AutoRoute(
          page: Language.page,
          path: '/language',
        ),
        AutoRoute(
            page: PaymentInformationRoute.page, path: '/payment-information'),
        AutoRoute(page: PaymentMethodsRoute.page, path: '/payment-methods'),
        AutoRoute(
            page: PaymentProcessingRoute.page, path: '/payment-processing')
      ];
}
