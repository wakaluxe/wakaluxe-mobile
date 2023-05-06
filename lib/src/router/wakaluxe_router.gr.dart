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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:wakaluxe/src/features/Communication/presentation/pages/messages.dart'
    as _i3;
import 'package:wakaluxe/src/features/onboarding/onboarding.dart' as _i1;
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_trip.dart'
    as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      final args =
          routeData.argsAs<WelcomeArgs>(orElse: () => const WelcomeArgs());
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Welcome(key: args.key),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseTheme(),
      );
    },
    MyTrip.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyTrip(),
      );
    },
    Messages.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Messages(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/welcome',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          Welcome.name,
          path: '/welcome',
        ),
        _i4.RouteConfig(
          ChooseLanguage.name,
          path: '/choose-language',
        ),
        _i4.RouteConfig(
          ChooseTheme.name,
          path: '/choose-theme',
        ),
        _i4.RouteConfig(
          MyTrip.name,
          path: '/my-trip',
        ),
        _i4.RouteConfig(
          Messages.name,
          path: '/messages',
        ),
      ];
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i4.PageRouteInfo<WelcomeArgs> {
  Welcome({_i5.Key? key})
      : super(
          Welcome.name,
          path: '/welcome',
          args: WelcomeArgs(key: key),
        );

  static const String name = 'Welcome';
}

class WelcomeArgs {
  const WelcomeArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'WelcomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.ChooseLanguage]
class ChooseLanguage extends _i4.PageRouteInfo<void> {
  const ChooseLanguage()
      : super(
          ChooseLanguage.name,
          path: '/choose-language',
        );

  static const String name = 'ChooseLanguage';
}

/// generated route for
/// [_i1.ChooseTheme]
class ChooseTheme extends _i4.PageRouteInfo<void> {
  const ChooseTheme()
      : super(
          ChooseTheme.name,
          path: '/choose-theme',
        );

  static const String name = 'ChooseTheme';
}

/// generated route for
/// [_i2.MyTrip]
class MyTrip extends _i4.PageRouteInfo<void> {
  const MyTrip()
      : super(
          MyTrip.name,
          path: '/my-trip',
        );

  static const String name = 'MyTrip';
}

/// generated route for
/// [_i3.Messages]
class Messages extends _i4.PageRouteInfo<void> {
  const Messages()
      : super(
          Messages.name,
          path: '/messages',
        );

  static const String name = 'Messages';
}
