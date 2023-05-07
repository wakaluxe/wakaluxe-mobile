import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/features/Communication/presentation/pages/message.dart';
import 'package:wakaluxe/src/features/Communication/presentation/pages/messages.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/create-new-password.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/forgot_password.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/language.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_profile.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_trip.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/notification.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/security.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/settings.dart';
import 'package:wakaluxe/src/features/Profile/presentation/pages/verify_password.dart';
import 'package:wakaluxe/src/features/onboarding/onboarding.dart';

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
    AutoRoute(
      page: MyTrip,
      path: '/my-trip',
    ),
    AutoRoute(
      page: Messages,
      path: '/messages',
    ),
    AutoRoute(
      page: Message,
      path: '/message/:id',
    ),
    AutoRoute(
      page: MyProfile,
      path: '/my-profile',
    ),
    AutoRoute(
      page: Notification,
      path: '/notifications',
    ),
    AutoRoute(
      page: Settings,
      path: '/settings',
    ),
    AutoRoute(
      page: Security,
      path: '/security',
    ),
    AutoRoute(
      page: VerifyPassword,
      path: '/verify-password',
    ),
    AutoRoute(
      page: ForgotPassword,
      path: '/forgot-password',
    ),
    AutoRoute(
      page: CreateNewPassword,
      path: '/create-new-password',
    ),
    AutoRoute(
      page: Language,
      path: '/language',
    ),
  ],
)
class $AppRouter {}
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
    AutoRoute(page: DailyObjectives.page, path: '/daily_objectices/:carId'),
    AutoRoute(page: DriverLogin.page, path: '/driver_login'),
    AutoRoute(page: DriverHome.page, path: '/driver_home')
  ];
}
