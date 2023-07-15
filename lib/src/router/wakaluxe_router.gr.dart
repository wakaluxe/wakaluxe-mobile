// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i40;
import 'package:flutter/material.dart' as _i41;
import 'package:wakaluxe/src/features/auth/presentation/login/screens/login.dart'
    as _i1;
import 'package:wakaluxe/src/features/auth/presentation/phone_number/screen/phone_number_screen.dart'
    as _i2;
import 'package:wakaluxe/src/features/auth/presentation/signup/screens/enter_full_name.dart'
    as _i4;
import 'package:wakaluxe/src/features/auth/presentation/signup/screens/phone_signup.dart'
    as _i5;
import 'package:wakaluxe/src/features/auth/presentation/signup/screens/signup_screen.dart'
    as _i6;
import 'package:wakaluxe/src/features/auth/presentation/verification/screen/verification_screen.dart'
    as _i7;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/available_cars.dart'
    as _i8;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/daily_objectives.dart'
    as _i9;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/maintainance_report.dart'
    as _i10;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/my_garage.dart'
    as _i11;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/rent_a_car.dart'
    as _i12;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/status_report.dart'
    as _i13;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/view_car.dart'
    as _i14;
import 'package:wakaluxe/src/features/car-rental/presentation/screens/view_in_garage.dart'
    as _i15;
import 'package:wakaluxe/src/features/Communication/presentation/pages/message.dart'
    as _i16;
import 'package:wakaluxe/src/features/Communication/presentation/pages/messages.dart'
    as _i17;
import 'package:wakaluxe/src/features/customer/presentation/home/home_2.dart'
    as _i18;
import 'package:wakaluxe/src/features/customer/presentation/home/screens/home_map.dart'
    as _i19;
import 'package:wakaluxe/src/features/customer/presentation/payment_details/screens/payment_details.dart'
    as _i20;
import 'package:wakaluxe/src/features/customer/presentation/rating/screens/rating.dart'
    as _i21;
import 'package:wakaluxe/src/features/driver/presentation/screens/driver_home.dart'
    as _i22;
import 'package:wakaluxe/src/features/driver/presentation/screens/driver_login.dart'
    as _i23;
import 'package:wakaluxe/src/features/onboarding/language/choose_language.dart'
    as _i24;
import 'package:wakaluxe/src/features/onboarding/thememode/choose_theme.dart'
    as _i25;
import 'package:wakaluxe/src/features/onboarding/welcome/welcome.dart' as _i26;
import 'package:wakaluxe/src/features/Profile/presentation/pages/confirm_pin.dart'
    as _i3;
import 'package:wakaluxe/src/features/Profile/presentation/pages/create-new-password.dart'
    as _i27;
import 'package:wakaluxe/src/features/Profile/presentation/pages/edit_profile.dart'
    as _i28;
import 'package:wakaluxe/src/features/Profile/presentation/pages/forgot_password.dart'
    as _i29;
import 'package:wakaluxe/src/features/Profile/presentation/pages/language.dart'
    as _i30;
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_profile.dart'
    as _i31;
import 'package:wakaluxe/src/features/Profile/presentation/pages/my_trip.dart'
    as _i32;
import 'package:wakaluxe/src/features/Profile/presentation/pages/notification.dart'
    as _i33;
import 'package:wakaluxe/src/features/Profile/presentation/pages/security.dart'
    as _i34;
import 'package:wakaluxe/src/features/Profile/presentation/pages/select_payment.dart'
    as _i35;
import 'package:wakaluxe/src/features/Profile/presentation/pages/settings.dart'
    as _i36;
import 'package:wakaluxe/src/features/Profile/presentation/pages/verify_password.dart'
    as _i37;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscription_detail_page.dart'
    as _i39;
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/pages/subscriptions_page.dart'
    as _i38;

abstract class $WakaluxAppRouter extends _i40.RootStackRouter {
  $WakaluxAppRouter({super.navigatorKey});

  @override
  final Map<String, _i40.PageFactory> pagesMap = {
    Login.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Login(),
      );
    },
    PhoneNumber.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WakaluxePhoneNumber(),
      );
    },
    WakaluxeCreatePin.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WakaluxeCreatePin(),
      );
    },
    EnterFullName.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EnterFullName(),
      );
    },
    PhoneSignUp.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WakaluxePhoneSignUp(),
      );
    },
    SignUp.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WakaluxeSignUp(),
      );
    },
    Verification.name: (routeData) {
      final args = routeData.argsAs<VerificationArgs>();
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WakaluxeVerification(
          key: args.key,
          phoneNumber: args.phoneNumber,
          verificationd: args.verificationd,
        ),
      );
    },
    AvailableCar.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AvailableCars(),
      );
    },
    DailyObjectives.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DailyObjectivesArgs>(
          orElse: () =>
              DailyObjectivesArgs(carId: pathParams.getString('carId')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DailyObjectives(
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
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.MaintainanceReport(
          carId: args.carId,
          key: args.key,
        ),
      );
    },
    MyGarage.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyGarage(),
      );
    },
    RentACar.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RentACar(),
      );
    },
    StatusReport.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<StatusReportArgs>(
          orElse: () => StatusReportArgs(carId: pathParams.getString('carId')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.StatusReport(
          carId: args.carId,
          key: args.key,
        ),
      );
    },
    ViewCar.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ViewCar(),
      );
    },
    ViewInGarage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ViewInGarageArgs>(
          orElse: () => ViewInGarageArgs(car: pathParams.getString('carId')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.ViewInGarage(
          car: args.car,
          key: args.key,
        ),
      );
    },
    Message.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageArgs>(
          orElse: () => MessageArgs(id: pathParams.getString('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.Message(
          id: args.id,
          key: args.key,
        ),
      );
    },
    Messages.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.Messages(),
      );
    },
    Home_2.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.Home2Screen(),
      );
    },
    HomeMap.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.HomeMap(),
      );
    },
    PaymentDetails.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.PaymentDetails(),
      );
    },
    Rating.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.Rating(),
      );
    },
    DriverHome.name: (routeData) {
      final args = routeData.argsAs<DriverHomeArgs>(
          orElse: () => const DriverHomeArgs());
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.DriverHome(key: args.key),
      );
    },
    DriverLogin.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.DriverLogin(),
      );
    },
    ChooseLanguage.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ChooseLanguage(),
      );
    },
    ChooseTheme.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ChooseTheme(),
      );
    },
    Welcome.name: (routeData) {
      final args =
          routeData.argsAs<WelcomeArgs>(orElse: () => const WelcomeArgs());
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.Welcome(key: args.key),
      );
    },
    CreateNewPassword.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.CreateNewPassword(),
      );
    },
    EditProfile.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.EditProfile(),
      );
    },
    ForgotPassword.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.ForgotPassword(),
      );
    },
    Language.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.Language(),
      );
    },
    MyProfile.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.MyProfile(),
      );
    },
    MyTrip.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.MyTrip(),
      );
    },
    Notification.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.Notification(),
      );
    },
    Security.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.Security(),
      );
    },
    SelectPayment.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.SelectPayment(),
      );
    },
    Settings.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.Settings(),
      );
    },
    VerifyPassword.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.VerifyPassword(),
      );
    },
    Subscriptions.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.WakaluxeSubscriptions(),
      );
    },
    SubscriptionDetail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SubscriptionDetailArgs>(
          orElse: () =>
              SubscriptionDetailArgs(plan: pathParams.getString('plan')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.WakaluxeSubscriptionDetail(
          plan: args.plan,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.Login]
class Login extends _i40.PageRouteInfo<void> {
  const Login({List<_i40.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WakaluxePhoneNumber]
class PhoneNumber extends _i40.PageRouteInfo<void> {
  const PhoneNumber({List<_i40.PageRouteInfo>? children})
      : super(
          PhoneNumber.name,
          initialChildren: children,
        );

  static const String name = 'PhoneNumber';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WakaluxeCreatePin]
class WakaluxeCreatePin extends _i40.PageRouteInfo<void> {
  const WakaluxeCreatePin({List<_i40.PageRouteInfo>? children})
      : super(
          WakaluxeCreatePin.name,
          initialChildren: children,
        );

  static const String name = 'WakaluxeCreatePin';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EnterFullName]
class EnterFullName extends _i40.PageRouteInfo<void> {
  const EnterFullName({List<_i40.PageRouteInfo>? children})
      : super(
          EnterFullName.name,
          initialChildren: children,
        );

  static const String name = 'EnterFullName';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WakaluxePhoneSignUp]
class PhoneSignUp extends _i40.PageRouteInfo<void> {
  const PhoneSignUp({List<_i40.PageRouteInfo>? children})
      : super(
          PhoneSignUp.name,
          initialChildren: children,
        );

  static const String name = 'PhoneSignUp';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WakaluxeSignUp]
class SignUp extends _i40.PageRouteInfo<void> {
  const SignUp({List<_i40.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WakaluxeVerification]
class Verification extends _i40.PageRouteInfo<VerificationArgs> {
  Verification({
    _i41.Key? key,
    required String phoneNumber,
    required String verificationd,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          Verification.name,
          args: VerificationArgs(
            key: key,
            phoneNumber: phoneNumber,
            verificationd: verificationd,
          ),
          initialChildren: children,
        );

  static const String name = 'Verification';

  static const _i40.PageInfo<VerificationArgs> page =
      _i40.PageInfo<VerificationArgs>(name);
}

class VerificationArgs {
  const VerificationArgs({
    this.key,
    required this.phoneNumber,
    required this.verificationd,
  });

  final _i41.Key? key;

  final String phoneNumber;

  final String verificationd;

  @override
  String toString() {
    return 'VerificationArgs{key: $key, phoneNumber: $phoneNumber, verificationd: $verificationd}';
  }
}

/// generated route for
/// [_i8.AvailableCars]
class AvailableCar extends _i40.PageRouteInfo<void> {
  const AvailableCar({List<_i40.PageRouteInfo>? children})
      : super(
          AvailableCar.name,
          initialChildren: children,
        );

  static const String name = 'AvailableCar';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i9.DailyObjectives]
class DailyObjectives extends _i40.PageRouteInfo<DailyObjectivesArgs> {
  DailyObjectives({
    required String carId,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static const _i40.PageInfo<DailyObjectivesArgs> page =
      _i40.PageInfo<DailyObjectivesArgs>(name);
}

class DailyObjectivesArgs {
  const DailyObjectivesArgs({
    required this.carId,
    this.key,
  });

  final String carId;

  final _i41.Key? key;

  @override
  String toString() {
    return 'DailyObjectivesArgs{carId: $carId, key: $key}';
  }
}

/// generated route for
/// [_i10.MaintainanceReport]
class MaintainanceReport extends _i40.PageRouteInfo<MaintainanceReportArgs> {
  MaintainanceReport({
    required String carId,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static const _i40.PageInfo<MaintainanceReportArgs> page =
      _i40.PageInfo<MaintainanceReportArgs>(name);
}

class MaintainanceReportArgs {
  const MaintainanceReportArgs({
    required this.carId,
    this.key,
  });

  final String carId;

  final _i41.Key? key;

  @override
  String toString() {
    return 'MaintainanceReportArgs{carId: $carId, key: $key}';
  }
}

/// generated route for
/// [_i11.MyGarage]
class MyGarage extends _i40.PageRouteInfo<void> {
  const MyGarage({List<_i40.PageRouteInfo>? children})
      : super(
          MyGarage.name,
          initialChildren: children,
        );

  static const String name = 'MyGarage';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RentACar]
class RentACar extends _i40.PageRouteInfo<void> {
  const RentACar({List<_i40.PageRouteInfo>? children})
      : super(
          RentACar.name,
          initialChildren: children,
        );

  static const String name = 'RentACar';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i13.StatusReport]
class StatusReport extends _i40.PageRouteInfo<StatusReportArgs> {
  StatusReport({
    required String carId,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static const _i40.PageInfo<StatusReportArgs> page =
      _i40.PageInfo<StatusReportArgs>(name);
}

class StatusReportArgs {
  const StatusReportArgs({
    required this.carId,
    this.key,
  });

  final String carId;

  final _i41.Key? key;

  @override
  String toString() {
    return 'StatusReportArgs{carId: $carId, key: $key}';
  }
}

/// generated route for
/// [_i14.ViewCar]
class ViewCar extends _i40.PageRouteInfo<void> {
  const ViewCar({List<_i40.PageRouteInfo>? children})
      : super(
          ViewCar.name,
          initialChildren: children,
        );

  static const String name = 'ViewCar';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ViewInGarage]
class ViewInGarage extends _i40.PageRouteInfo<ViewInGarageArgs> {
  ViewInGarage({
    required String car,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static const _i40.PageInfo<ViewInGarageArgs> page =
      _i40.PageInfo<ViewInGarageArgs>(name);
}

class ViewInGarageArgs {
  const ViewInGarageArgs({
    required this.car,
    this.key,
  });

  final String car;

  final _i41.Key? key;

  @override
  String toString() {
    return 'ViewInGarageArgs{car: $car, key: $key}';
  }
}

/// generated route for
/// [_i16.Message]
class Message extends _i40.PageRouteInfo<MessageArgs> {
  Message({
    required String id,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          Message.name,
          args: MessageArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'Message';

  static const _i40.PageInfo<MessageArgs> page =
      _i40.PageInfo<MessageArgs>(name);
}

class MessageArgs {
  const MessageArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i41.Key? key;

  @override
  String toString() {
    return 'MessageArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i17.Messages]
class Messages extends _i40.PageRouteInfo<void> {
  const Messages({List<_i40.PageRouteInfo>? children})
      : super(
          Messages.name,
          initialChildren: children,
        );

  static const String name = 'Messages';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i18.Home2Screen]
class Home_2 extends _i40.PageRouteInfo<void> {
  const Home_2({List<_i40.PageRouteInfo>? children})
      : super(
          Home_2.name,
          initialChildren: children,
        );

  static const String name = 'Home_2';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i19.HomeMap]
class HomeMap extends _i40.PageRouteInfo<void> {
  const HomeMap({List<_i40.PageRouteInfo>? children})
      : super(
          HomeMap.name,
          initialChildren: children,
        );

  static const String name = 'HomeMap';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PaymentDetails]
class PaymentDetails extends _i40.PageRouteInfo<void> {
  const PaymentDetails({List<_i40.PageRouteInfo>? children})
      : super(
          PaymentDetails.name,
          initialChildren: children,
        );

  static const String name = 'PaymentDetails';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i21.Rating]
class Rating extends _i40.PageRouteInfo<void> {
  const Rating({List<_i40.PageRouteInfo>? children})
      : super(
          Rating.name,
          initialChildren: children,
        );

  static const String name = 'Rating';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i22.DriverHome]
class DriverHome extends _i40.PageRouteInfo<DriverHomeArgs> {
  DriverHome({
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          DriverHome.name,
          args: DriverHomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DriverHome';

  static const _i40.PageInfo<DriverHomeArgs> page =
      _i40.PageInfo<DriverHomeArgs>(name);
}

class DriverHomeArgs {
  const DriverHomeArgs({this.key});

  final _i41.Key? key;

  @override
  String toString() {
    return 'DriverHomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.DriverLogin]
class DriverLogin extends _i40.PageRouteInfo<void> {
  const DriverLogin({List<_i40.PageRouteInfo>? children})
      : super(
          DriverLogin.name,
          initialChildren: children,
        );

  static const String name = 'DriverLogin';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ChooseLanguage]
class ChooseLanguage extends _i40.PageRouteInfo<void> {
  const ChooseLanguage({List<_i40.PageRouteInfo>? children})
      : super(
          ChooseLanguage.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguage';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ChooseTheme]
class ChooseTheme extends _i40.PageRouteInfo<void> {
  const ChooseTheme({List<_i40.PageRouteInfo>? children})
      : super(
          ChooseTheme.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTheme';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i26.Welcome]
class Welcome extends _i40.PageRouteInfo<WelcomeArgs> {
  Welcome({
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          Welcome.name,
          args: WelcomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i40.PageInfo<WelcomeArgs> page =
      _i40.PageInfo<WelcomeArgs>(name);
}

class WelcomeArgs {
  const WelcomeArgs({this.key});

  final _i41.Key? key;

  @override
  String toString() {
    return 'WelcomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i27.CreateNewPassword]
class CreateNewPassword extends _i40.PageRouteInfo<void> {
  const CreateNewPassword({List<_i40.PageRouteInfo>? children})
      : super(
          CreateNewPassword.name,
          initialChildren: children,
        );

  static const String name = 'CreateNewPassword';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i28.EditProfile]
class EditProfile extends _i40.PageRouteInfo<void> {
  const EditProfile({List<_i40.PageRouteInfo>? children})
      : super(
          EditProfile.name,
          initialChildren: children,
        );

  static const String name = 'EditProfile';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i29.ForgotPassword]
class ForgotPassword extends _i40.PageRouteInfo<void> {
  const ForgotPassword({List<_i40.PageRouteInfo>? children})
      : super(
          ForgotPassword.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPassword';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i30.Language]
class Language extends _i40.PageRouteInfo<void> {
  const Language({List<_i40.PageRouteInfo>? children})
      : super(
          Language.name,
          initialChildren: children,
        );

  static const String name = 'Language';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i31.MyProfile]
class MyProfile extends _i40.PageRouteInfo<void> {
  const MyProfile({List<_i40.PageRouteInfo>? children})
      : super(
          MyProfile.name,
          initialChildren: children,
        );

  static const String name = 'MyProfile';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i32.MyTrip]
class MyTrip extends _i40.PageRouteInfo<void> {
  const MyTrip({List<_i40.PageRouteInfo>? children})
      : super(
          MyTrip.name,
          initialChildren: children,
        );

  static const String name = 'MyTrip';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i33.Notification]
class Notification extends _i40.PageRouteInfo<void> {
  const Notification({List<_i40.PageRouteInfo>? children})
      : super(
          Notification.name,
          initialChildren: children,
        );

  static const String name = 'Notification';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i34.Security]
class Security extends _i40.PageRouteInfo<void> {
  const Security({List<_i40.PageRouteInfo>? children})
      : super(
          Security.name,
          initialChildren: children,
        );

  static const String name = 'Security';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i35.SelectPayment]
class SelectPayment extends _i40.PageRouteInfo<void> {
  const SelectPayment({List<_i40.PageRouteInfo>? children})
      : super(
          SelectPayment.name,
          initialChildren: children,
        );

  static const String name = 'SelectPayment';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i36.Settings]
class Settings extends _i40.PageRouteInfo<void> {
  const Settings({List<_i40.PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i37.VerifyPassword]
class VerifyPassword extends _i40.PageRouteInfo<void> {
  const VerifyPassword({List<_i40.PageRouteInfo>? children})
      : super(
          VerifyPassword.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPassword';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i38.WakaluxeSubscriptions]
class Subscriptions extends _i40.PageRouteInfo<void> {
  const Subscriptions({List<_i40.PageRouteInfo>? children})
      : super(
          Subscriptions.name,
          initialChildren: children,
        );

  static const String name = 'Subscriptions';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i39.WakaluxeSubscriptionDetail]
class SubscriptionDetail extends _i40.PageRouteInfo<SubscriptionDetailArgs> {
  SubscriptionDetail({
    required String plan,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static const _i40.PageInfo<SubscriptionDetailArgs> page =
      _i40.PageInfo<SubscriptionDetailArgs>(name);
}

class SubscriptionDetailArgs {
  const SubscriptionDetailArgs({
    required this.plan,
    this.key,
  });

  final String plan;

  final _i41.Key? key;

  @override
  String toString() {
    return 'SubscriptionDetailArgs{plan: $plan, key: $key}';
  }
}
