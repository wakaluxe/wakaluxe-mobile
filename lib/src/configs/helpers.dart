import 'package:wakaluxe/features/payments/data/models/payment_method_type.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

String getPhoneNumberType(String phoneNumber) {
  // Define patterns for Orange and MTN numbers in Cameroon
  final orangePattern = RegExp(r'^\+2376(9|6|7)\d{7}$');
  final mtnPattern = RegExp(r'^\+2376([5-8]|2[0-4])\d{7}$');

  // Check if the phone number matches the patterns
  if (orangePattern.hasMatch(phoneNumber)) {
    return 'Orange';
  } else if (mtnPattern.hasMatch(phoneNumber)) {
    return 'MTN';
  } else {
    return 'None';
  }

}



  String paymentMethodIcon(String type) {
    switch (type) {
      case PaymentMethodType.MTN:
        return Constants.mtnMoneyIcon;
      case PaymentMethodType.ORANGE:
        return Constants.orangeMoneyIcon;

      default:
        return Constants.hashtagIcon;
    }
  }
