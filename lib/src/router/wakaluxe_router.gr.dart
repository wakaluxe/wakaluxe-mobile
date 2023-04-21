// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:wakaluxe/src/features/onboarding/language/choose_language.dart'
    as _i2;
import 'package:wakaluxe/src/features/onboarding/thememode/choose_theme.dart'
    as _i1;
import 'package:wakaluxe/src/features/onboarding/welcome/welcome.dart' as _i3;

abstract class $WakaluxeRouter extends _i4.RootStackRouter {
  $WakaluxeRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ChooseTheme.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseTheme(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseLanguage(),
      );
    },
    Welcome.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Welcome(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChooseTheme]
class ChooseTheme extends _i4.PageRouteInfo<void> {
  const ChooseTheme({List<_i4.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChooseLanguage]
class ChooseLanguage extends _i4.PageRouteInfo<void> {
  const ChooseLanguage({List<_i4.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Welcome]
class Welcome extends _i4.PageRouteInfo<void> {
  const Welcome({List<_i4.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
