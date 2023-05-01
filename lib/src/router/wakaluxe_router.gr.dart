// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
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
import 'package:wakaluxe/src/features/car-rental/presentation/screens/my_garage.dart'
    as _i17;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/rent_a_car.dart'
    as _i7;
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
import 'package:wakaluxe/src/features/onboarding/language/choose_language.dart'
    as _i12;
import 'package:wakaluxe/src/features/onboarding/thememode/choose_theme.dart'
    as _i11;
import 'package:wakaluxe/src/features/onboarding/welcome/welcome.dart' as _i13;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart'
    as _i5;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart'
    as _i6;

abstract class $WakaluxeRouter extends _i18.RootStackRouter {
  $WakaluxeRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SignUp.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WakaluxeSignUp(),
      );
    },
    Verification.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxeVerification(),
      );
    },
    PhoneNumber.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WakaluxePhoneNumber(),
      );
    },
    Login.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WakaluxeLogin(),
      );
    },
    SubscriptionDetail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubscriptionDetailArgs>(
          orElse: () =>
              SubscriptionDetailArgs(plan: pathParams.getString('plan')));
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WakaluxeSubscriptionDetail(
          plan: args.plan,
          key: args.key,
        ),
      );
    },
    Subscriptions.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WakaluxeSubscriptions(),
      );
    },
    RentACar.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RentACar(),
      );
    },
    AvailableCar.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AvailableCars(),
      );
    },
    ViewCar.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ViewCar(),
      );
    },
    ViewInGarage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ViewInGarageArgs>(
          orElse: () => ViewInGarageArgs(car: pathParams.getString('carId')));
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ViewInGarage(
          car: args.car,
          key: args.key,
        ),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ChooseTheme(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ChooseLanguage(),
      );
    },
    Welcome.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Home(),
      );
    },
    Rating.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.Rating(),
      );
    },
    PaymentDetails.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentDetails(),
      );
    },
    MyGarage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MyGarage(),
      );
    },
  };
}

/// generated route for
/// [_i1.WakaluxeSignUp]
class SignUp extends _i18.PageRouteInfo<void> {
  const SignUp({List<_i18.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WakaluxeVerification]
class Verification extends _i18.PageRouteInfo<void> {
  const Verification({List<_i18.PageRouteInfo>? children})
      : super(
          Verification.name,
          initialChildren: children,
        );

  static const String name = 'Verification';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WakaluxePhoneNumber]
class PhoneNumber extends _i18.PageRouteInfo<void> {
  const PhoneNumber({List<_i18.PageRouteInfo>? children})
      : super(
          PhoneNumber.name,
          initialChildren: children,
        );

  static const String name = 'PhoneNumber';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WakaluxeLogin]
class Login extends _i18.PageRouteInfo<void> {
  const Login({List<_i18.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WakaluxeSubscriptionDetail]
class SubscriptionDetail extends _i18.PageRouteInfo<SubscriptionDetailArgs> {
  SubscriptionDetail({
    required String plan,
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
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

  static const _i18.PageInfo<SubscriptionDetailArgs> page =
      _i18.PageInfo<SubscriptionDetailArgs>(name);
}

class SubscriptionDetailArgs {
  const SubscriptionDetailArgs({
    required this.plan,
    this.key,
  });

  final String plan;

  final _i19.Key? key;

  @override
  String toString() {
    return 'SubscriptionDetailArgs{plan: $plan, key: $key}';
  }
}

/// generated route for
/// [_i6.WakaluxeSubscriptions]
class Subscriptions extends _i18.PageRouteInfo<void> {
  const Subscriptions({List<_i18.PageRouteInfo>? children})
      : super(
          Subscriptions.name,
          initialChildren: children,
        );

  static const String name = 'Subscriptions';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RentACar]
class RentACar extends _i18.PageRouteInfo<void> {
  const RentACar({List<_i18.PageRouteInfo>? children})
      : super(
          RentACar.name,
          initialChildren: children,
        );

  static const String name = 'RentACar';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AvailableCars]
class AvailableCar extends _i18.PageRouteInfo<void> {
  const AvailableCar({List<_i18.PageRouteInfo>? children})
      : super(
          AvailableCar.name,
          initialChildren: children,
        );

  static const String name = 'AvailableCar';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ViewCar]
class ViewCar extends _i18.PageRouteInfo<void> {
  const ViewCar({List<_i18.PageRouteInfo>? children})
      : super(
          ViewCar.name,
          initialChildren: children,
        );

  static const String name = 'ViewCar';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ViewInGarage]
class ViewInGarage extends _i18.PageRouteInfo<ViewInGarageArgs> {
  ViewInGarage({
    required String car,
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
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

  static const _i18.PageInfo<ViewInGarageArgs> page =
      _i18.PageInfo<ViewInGarageArgs>(name);
}

class ViewInGarageArgs {
  const ViewInGarageArgs({
    required this.car,
    this.key,
  });

  final String car;

  final _i19.Key? key;

  @override
  String toString() {
    return 'ViewInGarageArgs{car: $car, key: $key}';
  }
}

/// generated route for
/// [_i11.ChooseTheme]
class ChooseTheme extends _i18.PageRouteInfo<void> {
  const ChooseTheme({List<_i18.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ChooseLanguage]
class ChooseLanguage extends _i18.PageRouteInfo<void> {
  const ChooseLanguage({List<_i18.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.Welcome]
class Welcome extends _i18.PageRouteInfo<void> {
  const Welcome({List<_i18.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Home]
class Home extends _i18.PageRouteInfo<void> {
  const Home({List<_i18.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.Rating]
class Rating extends _i18.PageRouteInfo<void> {
  const Rating({List<_i18.PageRouteInfo>? children})
      : super(
          Rating.name,
          initialChildren: children,
        );

  static const String name = 'Rating';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentDetails]
class PaymentDetails extends _i18.PageRouteInfo<void> {
  const PaymentDetails({List<_i18.PageRouteInfo>? children})
      : super(
          PaymentDetails.name,
          initialChildren: children,
        );

  static const String name = 'PaymentDetails';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MyGarage]
class MyGarage extends _i18.PageRouteInfo<void> {
  const MyGarage({List<_i18.PageRouteInfo>? children})
      : super(
          MyGarage.name,
          initialChildren: children,
        );

  static const String name = 'MyGarage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
