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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:wakaluxe/src/features/Communication/presentation/pages/message.dart'
    as _i4;
import 'package:wakaluxe/src/features/Communication/presentation/pages/messages.dart'
    as _i3;
import 'package:wakaluxe/src/features/onboarding/onboarding.dart' as _i1;
import 'package:wakaluxe/src/features/Profile/presentation/pages/create-new-password.dart'
    as _i11;
import 'package:wakaluxe/src/features/Profile/presentation/pages/forgot_password.dart'
    as _i10;
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_profile.dart'
    as _i5;
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_trip.dart'
    as _i2;
import 'package:wakaluxe/src/features/Profile/presentation/pages/notification.dart'
    as _i6;
import 'package:wakaluxe/src/features/Profile/presentation/pages/security.dart'
    as _i8;
import 'package:wakaluxe/src/features/Profile/presentation/pages/settings.dart'
    as _i7;
import 'package:wakaluxe/src/features/Profile/presentation/pages/verify_password.dart'
    as _i9;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    Welcome.name: (routeData) {
      final args =
          routeData.argsAs<WelcomeArgs>(orElse: () => const WelcomeArgs());
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Welcome(key: args.key),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseTheme(),
      );
    },
    MyTrip.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyTrip(),
      );
    },
    Messages.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.Messages(),
      );
    },
    Message.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageArgs>(
          orElse: () => MessageArgs(id: pathParams.getString('id')));
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.Message(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MyProfile.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.MyProfile(),
      );
    },
    Notification.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.Notification(),
      );
    },
    Settings.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.Settings(),
      );
    },
    Security.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.Security(),
      );
    },
    VerifyPassword.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.VerifyPassword(),
      );
    },
    ForgotPassword.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgotPassword(),
      );
    },
    CreateNewPassword.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.CreateNewPassword(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/welcome',
          fullMatch: true,
        ),
        _i12.RouteConfig(
          Welcome.name,
          path: '/welcome',
        ),
        _i12.RouteConfig(
          ChooseLanguage.name,
          path: '/choose-language',
        ),
        _i12.RouteConfig(
          ChooseTheme.name,
          path: '/choose-theme',
        ),
        _i12.RouteConfig(
          MyTrip.name,
          path: '/my-trip',
        ),
        _i12.RouteConfig(
          Messages.name,
          path: '/messages',
        ),
        _i12.RouteConfig(
          Message.name,
          path: '/message/:id',
        ),
        _i12.RouteConfig(
          MyProfile.name,
          path: '/my-profile',
        ),
        _i12.RouteConfig(
          Notification.name,
          path: '/notifications',
        ),
        _i12.RouteConfig(
          Settings.name,
          path: '/settings',
        ),
        _i12.RouteConfig(
          Security.name,
          path: '/security',
        ),
        _i12.RouteConfig(
          VerifyPassword.name,
          path: '/verify-password',
        ),
        _i12.RouteConfig(
          ForgotPassword.name,
          path: '/forgot-password',
        ),
        _i12.RouteConfig(
          CreateNewPassword.name,
          path: '/create-new-password',
        ),
      ];
}

/// generated route for
/// [_i1.Welcome]
class Welcome extends _i12.PageRouteInfo<WelcomeArgs> {
  Welcome({_i13.Key? key})
      : super(
          Welcome.name,
          path: '/welcome',
          args: WelcomeArgs(key: key),
        );

  static const String name = 'Welcome';
}

class WelcomeArgs {
  const WelcomeArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'WelcomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.ChooseLanguage]
class ChooseLanguage extends _i12.PageRouteInfo<void> {
  const ChooseLanguage()
      : super(
          ChooseLanguage.name,
          path: '/choose-language',
        );

  static const String name = 'ChooseLanguage';
}

/// generated route for
/// [_i1.ChooseTheme]
class ChooseTheme extends _i12.PageRouteInfo<void> {
  const ChooseTheme()
      : super(
          ChooseTheme.name,
          path: '/choose-theme',
        );

  static const String name = 'ChooseTheme';
}

/// generated route for
/// [_i2.MyTrip]
class MyTrip extends _i12.PageRouteInfo<void> {
  const MyTrip()
      : super(
          MyTrip.name,
          path: '/my-trip',
        );

  static const String name = 'MyTrip';
}

/// generated route for
/// [_i3.Messages]
class Messages extends _i12.PageRouteInfo<void> {
  const Messages()
      : super(
          Messages.name,
          path: '/messages',
        );

  static const String name = 'Messages';
}

/// generated route for
/// [_i4.Message]
class Message extends _i12.PageRouteInfo<MessageArgs> {
  Message({
    _i13.Key? key,
    required String id,
  }) : super(
          Message.name,
          path: '/message/:id',
          args: MessageArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'Message';
}

class MessageArgs {
  const MessageArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final String id;

  @override
  String toString() {
    return 'MessageArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.MyProfile]
class MyProfile extends _i12.PageRouteInfo<void> {
  const MyProfile()
      : super(
          MyProfile.name,
          path: '/my-profile',
        );

  static const String name = 'MyProfile';
}

/// generated route for
/// [_i6.Notification]
class Notification extends _i12.PageRouteInfo<void> {
  const Notification()
      : super(
          Notification.name,
          path: '/notifications',
        );

  static const String name = 'Notification';
}

/// generated route for
/// [_i7.Settings]
class Settings extends _i12.PageRouteInfo<void> {
  const Settings()
      : super(
          Settings.name,
          path: '/settings',
        );

  static const String name = 'Settings';
}

/// generated route for
/// [_i8.Security]
class Security extends _i12.PageRouteInfo<void> {
  const Security()
      : super(
          Security.name,
          path: '/security',
        );

  static const String name = 'Security';
}

/// generated route for
/// [_i9.VerifyPassword]
class VerifyPassword extends _i12.PageRouteInfo<void> {
  const VerifyPassword()
      : super(
          VerifyPassword.name,
          path: '/verify-password',
        );

  static const String name = 'VerifyPassword';
}

/// generated route for
/// [_i10.ForgotPassword]
class ForgotPassword extends _i12.PageRouteInfo<void> {
  const ForgotPassword()
      : super(
          ForgotPassword.name,
          path: '/forgot-password',
        );

  static const String name = 'ForgotPassword';
}

/// generated route for
/// [_i11.CreateNewPassword]
class CreateNewPassword extends _i12.PageRouteInfo<void> {
  const CreateNewPassword()
      : super(
          CreateNewPassword.name,
          path: '/create-new-password',
        );

  static const String name = 'CreateNewPassword';
}
