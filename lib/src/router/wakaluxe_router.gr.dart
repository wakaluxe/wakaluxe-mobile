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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:wakaluxe/src/features/auth/presentation/presentation.dart'
    as _i2;
import 'package:wakaluxe/src/features/onboarding/onboarding.dart' as _i1;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart'
    as _i4;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart'
    as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.Welcome(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseTheme(),
      );
    },
    Verification.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Verification(),
      );
    },
    PhoneNumber.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.PhoneNumber(),
      );
    },
    Login.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Login(),
      );
    },
    SignUp.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignUp(),
      );
    },
    SubscriptionsRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SubscriptionsPage(),
      );
    },
    SubscriptionDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubscriptionDetailRouteArgs>(
          orElse: () =>
              SubscriptionDetailRouteArgs(plan: pathParams.getString('plan')));
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.SubscriptionDetailPage(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/welcome',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          Welcome.name,
          path: '/welcome',
        ),
        _i5.RouteConfig(
          ChooseLanguage.name,
          path: '/choose-language',
        ),
        _i5.RouteConfig(
          ChooseTheme.name,
          path: '/choose-theme',
        ),
        _i5.RouteConfig(
          Verification.name,
          path: '/verification',
        ),
        _i5.RouteConfig(
          PhoneNumber.name,
          path: '/phone-number',
        ),
        _i5.RouteConfig(
          Login.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          SignUp.name,
          path: '/sign-up',
        ),
        _i5.RouteConfig(
          SubscriptionsRoute.name,
          path: '/subscriptions',
        ),
        _i5.RouteConfig(
          SubscriptionDetailRoute.name,
          path: '/subscription-detail/:plan',
        ),
      ];
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i5.PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/welcome',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [_i1.ChooseLanguage]
class ChooseLanguage extends _i5.PageRouteInfo<void> {
  const ChooseLanguage()
      : super(
          ChooseLanguage.name,
          path: '/choose-language',
        );

  static const String name = 'ChooseLanguage';
}

/// generated route for
/// [_i1.ChooseTheme]
class ChooseTheme extends _i5.PageRouteInfo<void> {
  const ChooseTheme()
      : super(
          ChooseTheme.name,
          path: '/choose-theme',
        );

  static const String name = 'ChooseTheme';
}

/// generated route for
/// [_i2.Verification]
class Verification extends _i5.PageRouteInfo<void> {
  const Verification()
      : super(
          Verification.name,
          path: '/verification',
        );

  static const String name = 'Verification';
}

/// generated route for
/// [_i2.PhoneNumber]
class PhoneNumber extends _i5.PageRouteInfo<void> {
  const PhoneNumber()
      : super(
          PhoneNumber.name,
          path: '/phone-number',
        );

  static const String name = 'PhoneNumber';
}

/// generated route for
/// [_i2.Login]
class Login extends _i5.PageRouteInfo<void> {
  const Login()
      : super(
          Login.name,
          path: '/login',
        );

  static const String name = 'Login';
}

/// generated route for
/// [_i2.SignUp]
class SignUp extends _i5.PageRouteInfo<void> {
  const SignUp()
      : super(
          SignUp.name,
          path: '/sign-up',
        );

  static const String name = 'SignUp';
}

/// generated route for
/// [_i3.SubscriptionsPage]
class SubscriptionsRoute extends _i5.PageRouteInfo<void> {
  const SubscriptionsRoute()
      : super(
          SubscriptionsRoute.name,
          path: '/subscriptions',
        );

  static const String name = 'SubscriptionsRoute';
}

/// generated route for
/// [_i4.SubscriptionDetailPage]
class SubscriptionDetailRoute
    extends _i5.PageRouteInfo<SubscriptionDetailRouteArgs> {
  SubscriptionDetailRoute({
    _i6.Key? key,
    required String plan,
  }) : super(
          SubscriptionDetailRoute.name,
          path: '/subscription-detail/:plan',
          args: SubscriptionDetailRouteArgs(
            key: key,
            plan: plan,
          ),
          rawPathParams: {'plan': plan},
        );

  static const String name = 'SubscriptionDetailRoute';
}

class SubscriptionDetailRouteArgs {
  const SubscriptionDetailRouteArgs({
    this.key,
    required this.plan,
  });

  final _i6.Key? key;

  final String plan;

  @override
  String toString() {
    return 'SubscriptionDetailRouteArgs{key: $key, plan: $plan}';
  }
}
