class PaymentMethodType {
  static const String MTN = 'mtn';
  static const String ORANGE = 'orange';
  static const String BANK = 'bank';
  static const String MOBILE = 'mobile';
  static const String OTHER = 'other';
  static const String UNDERFINED = 'undefined';
  static const String CASH = 'cash';

  static const Map<String, String> map = {
    MTN: 'MTN',
    ORANGE: 'Orange',
    BANK: 'Bank',
    MOBILE: 'Mobile',
    OTHER: 'Other',
    UNDERFINED: 'Undefined',
    CASH: 'Cash',
  };

  static const Map<String, String> reverseMap = {
    'MTN': MTN,
    'Orange': ORANGE,
    'Bank': BANK,
    'Mobile': MOBILE,
    'Other': OTHER,
    'Undefined': UNDERFINED,
    'Cash': CASH,
  };
}
