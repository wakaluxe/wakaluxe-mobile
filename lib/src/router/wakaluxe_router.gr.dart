// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:wakaluxe/src/features/customer/home.dart' as _i4;
import 'package:wakaluxe/src/features/onboarding/language/choose_language.dart'
    as _i2;
import 'package:wakaluxe/src/features/onboarding/thememode/choose_theme.dart'
    as _i1;
import 'package:wakaluxe/src/features/onboarding/welcome/welcome.dart' as _i3;

abstract class $WakaluxeRouter extends _i5.RootStackRouter {
  $WakaluxeRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ChooseTheme.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseTheme(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseLanguage(),
      );
    },
    Welcome.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Welcome(),
      );
    },
    Home.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Home(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChooseTheme]
class ChooseTheme extends _i5.PageRouteInfo<void> {
  const ChooseTheme({List<_i5.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChooseLanguage]
class ChooseLanguage extends _i5.PageRouteInfo<void> {
  const ChooseLanguage({List<_i5.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Welcome]
class Welcome extends _i5.PageRouteInfo<void> {
  const Welcome({List<_i5.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Home]
class Home extends _i5.PageRouteInfo<void> {
  const Home({List<_i5.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
