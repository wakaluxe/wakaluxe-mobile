class Constants {
  static const String appName = 'Wakaluxe';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Wakaluxe';

  static const double borderRadius = 14;
  static const double buttonHeight = 52;

  static const String profile = 'assets/images/profile.png';
  static const String chat = 'assets/images/chat.png';

  static const String closeIcon = 'assets/icons/hicon/bold/close.svg';
  static const String locationIcon = 'assets/icons/hicon/linear/location.svg';
  static const String settingIcon = 'assets/icons/hicon/linear/setting.svg';
  static const String headphoneIcon = 'assets/icons/hicon/linear/headphone.svg';
  static const String messageIcon = 'assets/icons/hicon/linear/message.svg';
  static const String backBoldIcon = 'assets/icons/hicon/bold/left.svg';
  static const String searchIcon = 'assets/icons/hicon/linear/search.svg';
  static const String calendarIcon = 'assets/icons/hicon/linear/calendar.svg';
  static const String callIcon = 'assets/icons/hicon/linear/call.svg';
  static const String sendIcon = 'assets/icons/hicon/linear/send.svg';
  static const String nearbyIcon = 'assets/icons/nearby.svg';
  static const String markerIcon = 'assets/icons/marker.svg';
  static const String moreSquareIcon = 'assets/icons/hicon/linear/more_square.svg';



}

enum TripState {
  upcoming,
  completed,
  cancelled,
  pending,
}

extension TripStateExtension on TripState {
  String get name {
    switch (this) {
      case TripState.upcoming:
        return 'Upcoming';
      case TripState.completed:
        return 'Completed';
      case TripState.cancelled:
        return 'Cancelled';
      case TripState.pending:
        return 'Pending';
      default:
        return 'Unknown';
    }
  }
}
