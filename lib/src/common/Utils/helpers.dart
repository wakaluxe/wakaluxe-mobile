// days of the week formatter from datetime
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String daysOfWeekFormatter(DateTime date, {bool short = false}) {
  final formatter = DateFormat(short ? 'E' : 'EEEE');
  return formatter.format(date);
}

String? phoneNumberValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your phone number';
  }
  if (value.length < 8) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? otpValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your OTP';
  }
  if (value.length < 6) {
    return 'Please enter a valid OTP';
  }
  return null;
}

String? requireValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your OTP';
  }

  return null;
}

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your email';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

final phoneFormatter = MaskTextInputFormatter(
  mask: '+237 ###-##-##-##',
  filter: {'#': RegExp('[0-9]')},
);

final otpFormatter = MaskTextInputFormatter(
  mask: '######',
  filter: {'#': RegExp('[0-9]')},
);

Future<void> postNavigationAuthedRouteName(
  String routeName,
) async {
  var finalRoute = routeName;
  if (routeName == '/sign-up') {
    finalRoute = '/home-2';
  }
  final box = await Hive.openBox<String>('post_auth_navigation');
  await box.put('current', finalRoute);
  await box.close();
}

Future<String> getNavigationAuthedRouteName() async {
  final box = await Hive.openBox<String>('post_auth_navigation');
  final value = box.get('current')!;
  await box.close();
  return value;
}
