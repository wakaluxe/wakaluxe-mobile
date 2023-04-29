// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:wakaluxe/src/features/auth/presentation/login/screens/login.dart'
    as _i4;
import 'package:wakaluxe/src/features/auth/presentation/phone_number/screen/phone_number_screen.dart'
    as _i3;
import 'package:wakaluxe/src/features/auth/presentation/signup/screens/signup_screen.dart'
    as _i1;
import 'package:wakaluxe/src/features/auth/presentation/verification/screen/verification_screen.dart'
    as _i2;
import 'package:wakaluxe/src/features/customer/presentation/home/screens/home.dart'
    as _i10;
import 'package:wakaluxe/src/features/onboarding/language/choose_language.dart'
    as _i8;
import 'package:wakaluxe/src/features/onboarding/thememode/choose_theme.dart'
    as _i7;
import 'package:wakaluxe/src/features/onboarding/welcome/welcome.dart' as _i9;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart'
    as _i5;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart'
    as _i6;

abstract class $WakaluxeRouter extends _i11.RootStackRouter {
  $WakaluxeRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SignUp.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WakaluxeSignUp(),
      );
    },
    Verification.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxeVerification(),
      );
    },
    PhoneNumber.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WakaluxePhoneNumber(),
      );
    },
    Login.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WakaluxeLogin(),
      );
    },
    SubscriptionDetail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubscriptionDetailArgs>(
          orElse: () =>
              SubscriptionDetailArgs(plan: pathParams.getString('plan')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WakaluxeSubscriptionDetail(
          plan: args.plan,
          key: args.key,
        ),
      );
    },
    Subscriptions.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WakaluxeSubscriptions(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ChooseTheme(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ChooseLanguage(),
      );
    },
    Welcome.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Home(),
      );
    },
  };
}

/// generated route for
/// [_i1.WakaluxeSignUp]
class SignUp extends _i11.PageRouteInfo<void> {
  const SignUp({List<_i11.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WakaluxeVerification]
class Verification extends _i11.PageRouteInfo<void> {
  const Verification({List<_i11.PageRouteInfo>? children})
      : super(
          Verification.name,
          initialChildren: children,
        );

  static const String name = 'Verification';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WakaluxePhoneNumber]
class PhoneNumber extends _i11.PageRouteInfo<void> {
  const PhoneNumber({List<_i11.PageRouteInfo>? children})
      : super(
          PhoneNumber.name,
          initialChildren: children,
        );

  static const String name = 'PhoneNumber';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WakaluxeLogin]
class Login extends _i11.PageRouteInfo<void> {
  const Login({List<_i11.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WakaluxeSubscriptionDetail]
class SubscriptionDetail extends _i11.PageRouteInfo<SubscriptionDetailArgs> {
  SubscriptionDetail({
    required String plan,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<SubscriptionDetailArgs> page =
      _i11.PageInfo<SubscriptionDetailArgs>(name);
}

class SubscriptionDetailArgs {
  const SubscriptionDetailArgs({
    required this.plan,
    this.key,
  });

  final String plan;

  final _i12.Key? key;

  @override
  String toString() {
    return 'SubscriptionDetailArgs{plan: $plan, key: $key}';
  }
}

/// generated route for
/// [_i6.WakaluxeSubscriptions]
class Subscriptions extends _i11.PageRouteInfo<void> {
  const Subscriptions({List<_i11.PageRouteInfo>? children})
      : super(
          Subscriptions.name,
          initialChildren: children,
        );

  static const String name = 'Subscriptions';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ChooseTheme]
class ChooseTheme extends _i11.PageRouteInfo<void> {
  const ChooseTheme({List<_i11.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ChooseLanguage]
class ChooseLanguage extends _i11.PageRouteInfo<void> {
  const ChooseLanguage({List<_i11.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Welcome]
class Welcome extends _i11.PageRouteInfo<void> {
  const Welcome({List<_i11.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Home]
class Home extends _i11.PageRouteInfo<void> {
  const Home({List<_i11.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
