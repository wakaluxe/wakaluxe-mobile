// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:wakaluxe/src/features/auth/presentation/presentation.dart'
    as _i2;
import 'package:wakaluxe/src/features/onboarding/onboarding.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseTheme(),
      );
    },
    Verification.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Verification(),
      );
    },
    PhoneNumber.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.PhoneNumber(),
      );
    },
    Login.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Login(),
      );
    },
    SignUp.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignUp(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/welcome',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          Welcome.name,
          path: '/welcome',
        ),
        _i3.RouteConfig(
          ChooseLanguage.name,
          path: '/choose-language',
        ),
        _i3.RouteConfig(
          ChooseTheme.name,
          path: '/choose-theme',
        ),
        _i3.RouteConfig(
          Verification.name,
          path: '/verification',
        ),
        _i3.RouteConfig(
          PhoneNumber.name,
          path: '/phone-number',
        ),
        _i3.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i3.RouteConfig(
          SignUp.name,
          path: '/sign-up',
        ),
      ];
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i3.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/welcome',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i1.ChooseLanguage]
class ChooseLanguage extends _i3.PageRouteInfo<void> {
  const ChooseLanguage()
      : super(
          ChooseLanguage.name,
          path: '/choose-language',
        );

  static const String name = 'ChooseLanguage';
}

/// generated route for
/// [_i1.ChooseTheme]
class ChooseTheme extends _i3.PageRouteInfo<void> {
  const ChooseTheme()
      : super(
          ChooseTheme.name,
          path: '/choose-theme',
        );

  static const String name = 'ChooseTheme';
}

/// generated route for
/// [_i2.Verification]
class Verification extends _i3.PageRouteInfo<void> {
  const Verification()
      : super(
          Verification.name,
          path: '/verification',
        );

  static const String name = 'Verification';
}

/// generated route for
/// [_i2.PhoneNumber]
class PhoneNumber extends _i3.PageRouteInfo<void> {
  const PhoneNumber()
      : super(
          PhoneNumber.name,
          path: '/phone-number',
        );

  static const String name = 'PhoneNumber';
}

/// generated route for
/// [_i2.Login]
class Login extends _i3.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i2.SignUp]
class SignUp extends _i3.PageRouteInfo<void> {
  const SignUp()
      : super(
          SignUp.name,
          path: '/sign-up',
        );

  static const String name = 'SignUp';
}
