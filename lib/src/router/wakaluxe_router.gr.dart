// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:wakaluxe/src/features/auth/presentation/login/screens/login.dart'
    as _i4;
import 'package:wakaluxe/src/features/auth/presentation/phone_number/screen/phone_number_screen.dart'
    as _i3;
import 'package:wakaluxe/src/features/auth/presentation/signup/screens/signup_screen.dart'
    as _i1;
import 'package:wakaluxe/src/features/auth/presentation/verification/screen/verification_screen.dart'
    as _i2;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/available_cars.dart'
    as _i8;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/daily_objectives.dart'
    as _i20;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/maintainance_report.dart'
    as _i19;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/my_garage.dart'
    as _i17;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/rent_a_car.dart'
    as _i7;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/status_report.dart'
    as _i18;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/view_car.dart'
    as _i9;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/view_in_garage.dart'
    as _i10;
import 'package:wakaluxe/src/features/customer/presentation/home/screens/home.dart'
    as _i14;
import 'package:wakaluxe/src/features/customer/presentation/payment_details/screens/payment_details.dart'
    as _i16;
import 'package:wakaluxe/src/features/customer/presentation/rating/screens/rating.dart'
    as _i15;
import 'package:wakaluxe/src/features/driver/presentation/screens/driver_home.dart'
    as _i22;
import 'package:wakaluxe/src/features/driver/presentation/screens/driver_login.dart'
    as _i21;
import 'package:wakaluxe/src/features/onboarding/language/choose_language.dart'
    as _i12;
import 'package:wakaluxe/src/features/onboarding/thememode/choose_theme.dart'
    as _i11;
import 'package:wakaluxe/src/features/onboarding/welcome/welcome.dart' as _i13;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart'
    as _i5;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart'
    as _i6;

abstract class $WakaluxeRouter extends _i23.RootStackRouter {
  $WakaluxeRouter({super.navigatorKey});

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    SignUp.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WakaluxeSignUp(),
      );
    },
    Verification.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxeVerification(),
      );
    },
    PhoneNumber.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WakaluxePhoneNumber(),
      );
    },
    Login.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WakaluxeLogin(),
      );
    },
    SubscriptionDetail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubscriptionDetailArgs>(
          orElse: () =>
              SubscriptionDetailArgs(plan: pathParams.getString('plan')));
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WakaluxeSubscriptionDetail(
          plan: args.plan,
          key: args.key,
        ),
      );
    },
    Subscriptions.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WakaluxeSubscriptions(),
      );
    },
    RentACar.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RentACar(),
      );
    },
    AvailableCar.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AvailableCars(),
      );
    },
    ViewCar.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ViewCar(),
      );
    },
    ViewInGarage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ViewInGarageArgs>(
          orElse: () => ViewInGarageArgs(car: pathParams.getString('carId')));
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ViewInGarage(
          car: args.car,
          key: args.key,
        ),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ChooseTheme(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ChooseLanguage(),
      );
    },
    Welcome.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Home(),
      );
    },
    Rating.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.Rating(),
      );
    },
    PaymentDetails.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentDetails(),
      );
    },
    MyGarage.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MyGarage(),
      );
    },
    StatusReport.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<StatusReportArgs>(
          orElse: () => StatusReportArgs(carId: pathParams.getString('carId')));
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.StatusReport(
          carId: args.carId,
          key: args.key,
        ),
      );
    },
    MaintainanceReport.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MaintainanceReportArgs>(
          orElse: () =>
              MaintainanceReportArgs(carId: pathParams.getString('carId')));
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.MaintainanceReport(
          carId: args.carId,
          key: args.key,
        ),
      );
    },
    DailyObjectives.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DailyObjectivesArgs>(
          orElse: () =>
              DailyObjectivesArgs(carId: pathParams.getString('carId')));
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.DailyObjectives(
          carId: args.carId,
          key: args.key,
        ),
      );
    },
    DriverLogin.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.DriverLogin(),
      );
    },
    DriverHome.name: (routeData) {
      final args = routeData.argsAs<DriverHomeArgs>(
          orElse: () => const DriverHomeArgs());
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.DriverHome(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.WakaluxeSignUp]
class SignUp extends _i23.PageRouteInfo<void> {
  const SignUp({List<_i23.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WakaluxeVerification]
class Verification extends _i23.PageRouteInfo<void> {
  const Verification({List<_i23.PageRouteInfo>? children})
      : super(
          Verification.name,
          initialChildren: children,
        );

  static const String name = 'Verification';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WakaluxePhoneNumber]
class PhoneNumber extends _i23.PageRouteInfo<void> {
  const PhoneNumber({List<_i23.PageRouteInfo>? children})
      : super(
          PhoneNumber.name,
          initialChildren: children,
        );

  static const String name = 'PhoneNumber';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WakaluxeLogin]
class Login extends _i23.PageRouteInfo<void> {
  const Login({List<_i23.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WakaluxeSubscriptionDetail]
class SubscriptionDetail extends _i23.PageRouteInfo<SubscriptionDetailArgs> {
  SubscriptionDetail({
    required String plan,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          SubscriptionDetail.name,
          args: SubscriptionDetailArgs(
            plan: plan,
            key: key,
          ),
          rawPathParams: {'plan': plan},
          initialChildren: children,
        );

  static const String name = 'SubscriptionDetail';

  static const _i23.PageInfo<SubscriptionDetailArgs> page =
      _i23.PageInfo<SubscriptionDetailArgs>(name);
}

class SubscriptionDetailArgs {
  const SubscriptionDetailArgs({
    required this.plan,
    this.key,
  });

  final String plan;

  final _i24.Key? key;

  @override
  String toString() {
    return 'SubscriptionDetailArgs{plan: $plan, key: $key}';
  }
}

/// generated route for
/// [_i6.WakaluxeSubscriptions]
class Subscriptions extends _i23.PageRouteInfo<void> {
  const Subscriptions({List<_i23.PageRouteInfo>? children})
      : super(
          Subscriptions.name,
          initialChildren: children,
        );

  static const String name = 'Subscriptions';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RentACar]
class RentACar extends _i23.PageRouteInfo<void> {
  const RentACar({List<_i23.PageRouteInfo>? children})
      : super(
          RentACar.name,
          initialChildren: children,
        );

  static const String name = 'RentACar';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AvailableCars]
class AvailableCar extends _i23.PageRouteInfo<void> {
  const AvailableCar({List<_i23.PageRouteInfo>? children})
      : super(
          AvailableCar.name,
          initialChildren: children,
        );

  static const String name = 'AvailableCar';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ViewCar]
class ViewCar extends _i23.PageRouteInfo<void> {
  const ViewCar({List<_i23.PageRouteInfo>? children})
      : super(
          ViewCar.name,
          initialChildren: children,
        );

  static const String name = 'ViewCar';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ViewInGarage]
class ViewInGarage extends _i23.PageRouteInfo<ViewInGarageArgs> {
  ViewInGarage({
    required String car,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          ViewInGarage.name,
          args: ViewInGarageArgs(
            car: car,
            key: key,
          ),
          rawPathParams: {'carId': car},
          initialChildren: children,
        );

  static const String name = 'ViewInGarage';

  static const _i23.PageInfo<ViewInGarageArgs> page =
      _i23.PageInfo<ViewInGarageArgs>(name);
}

class ViewInGarageArgs {
  const ViewInGarageArgs({
    required this.car,
    this.key,
  });

  final String car;

  final _i24.Key? key;

  @override
  String toString() {
    return 'ViewInGarageArgs{car: $car, key: $key}';
  }
}

/// generated route for
/// [_i11.ChooseTheme]
class ChooseTheme extends _i23.PageRouteInfo<void> {
  const ChooseTheme({List<_i23.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ChooseLanguage]
class ChooseLanguage extends _i23.PageRouteInfo<void> {
  const ChooseLanguage({List<_i23.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i13.Welcome]
class Welcome extends _i23.PageRouteInfo<void> {
  const Welcome({List<_i23.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Home]
class Home extends _i23.PageRouteInfo<void> {
  const Home({List<_i23.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i15.Rating]
class Rating extends _i23.PageRouteInfo<void> {
  const Rating({List<_i23.PageRouteInfo>? children})
      : super(
          Rating.name,
          initialChildren: children,
        );

  static const String name = 'Rating';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentDetails]
class PaymentDetails extends _i23.PageRouteInfo<void> {
  const PaymentDetails({List<_i23.PageRouteInfo>? children})
      : super(
          PaymentDetails.name,
          initialChildren: children,
        );

  static const String name = 'PaymentDetails';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MyGarage]
class MyGarage extends _i23.PageRouteInfo<void> {
  const MyGarage({List<_i23.PageRouteInfo>? children})
      : super(
          MyGarage.name,
          initialChildren: children,
        );

  static const String name = 'MyGarage';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i18.StatusReport]
class StatusReport extends _i23.PageRouteInfo<StatusReportArgs> {
  StatusReport({
    required String carId,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          StatusReport.name,
          args: StatusReportArgs(
            carId: carId,
            key: key,
          ),
          rawPathParams: {'carId': carId},
          initialChildren: children,
        );

  static const String name = 'StatusReport';

  static const _i23.PageInfo<StatusReportArgs> page =
      _i23.PageInfo<StatusReportArgs>(name);
}

class StatusReportArgs {
  const StatusReportArgs({
    required this.carId,
    this.key,
  });

  final String carId;

  final _i24.Key? key;

  @override
  String toString() {
    return 'StatusReportArgs{carId: $carId, key: $key}';
  }
}

/// generated route for
/// [_i19.MaintainanceReport]
class MaintainanceReport extends _i23.PageRouteInfo<MaintainanceReportArgs> {
  MaintainanceReport({
    required String carId,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          MaintainanceReport.name,
          args: MaintainanceReportArgs(
            carId: carId,
            key: key,
          ),
          rawPathParams: {'carId': carId},
          initialChildren: children,
        );

  static const String name = 'MaintainanceReport';

  static const _i23.PageInfo<MaintainanceReportArgs> page =
      _i23.PageInfo<MaintainanceReportArgs>(name);
}

class MaintainanceReportArgs {
  const MaintainanceReportArgs({
    required this.carId,
    this.key,
  });

  final String carId;

  final _i24.Key? key;

  @override
  String toString() {
    return 'MaintainanceReportArgs{carId: $carId, key: $key}';
  }
}

/// generated route for
/// [_i20.DailyObjectives]
class DailyObjectives extends _i23.PageRouteInfo<DailyObjectivesArgs> {
  DailyObjectives({
    required String carId,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          DailyObjectives.name,
          args: DailyObjectivesArgs(
            carId: carId,
            key: key,
          ),
          rawPathParams: {'carId': carId},
          initialChildren: children,
        );

  static const String name = 'DailyObjectives';

  static const _i23.PageInfo<DailyObjectivesArgs> page =
      _i23.PageInfo<DailyObjectivesArgs>(name);
}

class DailyObjectivesArgs {
  const DailyObjectivesArgs({
    required this.carId,
    this.key,
  });

  final String carId;

  final _i24.Key? key;

  @override
  String toString() {
    return 'DailyObjectivesArgs{carId: $carId, key: $key}';
  }
}

/// generated route for
/// [_i21.DriverLogin]
class DriverLogin extends _i23.PageRouteInfo<void> {
  const DriverLogin({List<_i23.PageRouteInfo>? children})
      : super(
          DriverLogin.name,
          initialChildren: children,
        );

  static const String name = 'DriverLogin';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i22.DriverHome]
class DriverHome extends _i23.PageRouteInfo<DriverHomeArgs> {
  DriverHome({
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          DriverHome.name,
          args: DriverHomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DriverHome';

  static const _i23.PageInfo<DriverHomeArgs> page =
      _i23.PageInfo<DriverHomeArgs>(name);
}

class DriverHomeArgs {
  const DriverHomeArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'DriverHomeArgs{key: $key}';
  }
}
