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
    WakaluxeWelcome.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WakaluxeWelcome(),
      );
    },
    WakaluxeChooseLanguage.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WakaluxeChooseLanguage(),
      );
    },
    WakaluxeChooseTheme.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WakaluxeChooseTheme(),
      );
    },
    WakaluxeVerification.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxeVerification(),
      );
    },
    WakaluxePhoneNumber.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxePhoneNumber(),
      );
    },
    WakaluxeLogin.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxeLogin(),
      );
    },
    WakaluxeSignUp.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxeSignUp(),
      );
    },
    WakaluxeSubscriptions.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.WakaluxeSubscriptions(),
      );
    },
    WakaluxeSubscriptionDetail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WakaluxeSubscriptionDetailArgs>(
          orElse: () => WakaluxeSubscriptionDetailArgs(
              plan: pathParams.getString('plan')));
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.WakaluxeSubscriptionDetail(
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
          WakaluxeWelcome.name,
          path: '/welcome',
        ),
        _i5.RouteConfig(
          WakaluxeChooseLanguage.name,
          path: '/choose-language',
        ),
        _i5.RouteConfig(
          WakaluxeChooseTheme.name,
          path: '/choose-theme',
        ),
        _i5.RouteConfig(
          WakaluxeVerification.name,
          path: '/verification',
        ),
        _i5.RouteConfig(
          WakaluxePhoneNumber.name,
          path: '/phone-number',
        ),
        _i5.RouteConfig(
          WakaluxeLogin.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          WakaluxeSignUp.name,
          path: '/sign-up',
        ),
        _i5.RouteConfig(
          WakaluxeSubscriptions.name,
          path: '/subscriptions',
        ),
        _i5.RouteConfig(
          WakaluxeSubscriptionDetail.name,
          path: '/subscription-detail/:plan',
        ),
      ];
}

/// generated route for
/// [_i1.WakaluxeWelcome]
class WakaluxeWelcome extends _i5.PageRouteInfo<void> {
  const WakaluxeWelcome()
      : super(
          WakaluxeWelcome.name,
          path: '/welcome',
        );

  static const String name = 'WakaluxeWelcome';
}

/// generated route for
/// [_i1.WakaluxeChooseLanguage]
class WakaluxeChooseLanguage extends _i5.PageRouteInfo<void> {
  const WakaluxeChooseLanguage()
      : super(
          WakaluxeChooseLanguage.name,
          path: '/choose-language',
        );

  static const String name = 'WakaluxeChooseLanguage';
}

/// generated route for
/// [_i1.WakaluxeChooseTheme]
class WakaluxeChooseTheme extends _i5.PageRouteInfo<void> {
  const WakaluxeChooseTheme()
      : super(
          WakaluxeChooseTheme.name,
          path: '/choose-theme',
        );

  static const String name = 'WakaluxeChooseTheme';
}

/// generated route for
/// [_i2.WakaluxeVerification]
class WakaluxeVerification extends _i5.PageRouteInfo<void> {
  const WakaluxeVerification()
      : super(
          WakaluxeVerification.name,
          path: '/verification',
        );

  static const String name = 'WakaluxeVerification';
}

/// generated route for
/// [_i2.WakaluxePhoneNumber]
class WakaluxePhoneNumber extends _i5.PageRouteInfo<void> {
  const WakaluxePhoneNumber()
      : super(
          WakaluxePhoneNumber.name,
          path: '/phone-number',
        );

  static const String name = 'WakaluxePhoneNumber';
}

/// generated route for
/// [_i2.WakaluxeLogin]
class WakaluxeLogin extends _i5.PageRouteInfo<void> {
  const WakaluxeLogin()
      : super(
          WakaluxeLogin.name,
          path: '/login',
        );

  static const String name = 'WakaluxeLogin';
}

/// generated route for
/// [_i2.WakaluxeSignUp]
class WakaluxeSignUp extends _i5.PageRouteInfo<void> {
  const WakaluxeSignUp()
      : super(
          WakaluxeSignUp.name,
          path: '/sign-up',
        );

  static const String name = 'WakaluxeSignUp';
}

/// generated route for
/// [_i3.WakaluxeSubscriptions]
class WakaluxeSubscriptions extends _i5.PageRouteInfo<void> {
  const WakaluxeSubscriptions()
      : super(
          WakaluxeSubscriptions.name,
          path: '/subscriptions',
        );

  static const String name = 'WakaluxeSubscriptions';
}

/// generated route for
/// [_i4.WakaluxeSubscriptionDetail]
class WakaluxeSubscriptionDetail
    extends _i5.PageRouteInfo<WakaluxeSubscriptionDetailArgs> {
  WakaluxeSubscriptionDetail({
    _i6.Key? key,
    required String plan,
  }) : super(
          WakaluxeSubscriptionDetail.name,
          path: '/subscription-detail/:plan',
          args: WakaluxeSubscriptionDetailArgs(
            key: key,
            plan: plan,
          ),
          rawPathParams: {'plan': plan},
        );

  static const String name = 'WakaluxeSubscriptionDetail';
}

class WakaluxeSubscriptionDetailArgs {
  const WakaluxeSubscriptionDetailArgs({
    this.key,
    required this.plan,
  });

  final _i6.Key? key;

  final String plan;

  @override
  String toString() {
    return 'WakaluxeSubscriptionDetailArgs{key: $key, plan: $plan}';
  }
}
