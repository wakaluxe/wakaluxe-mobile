import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class Constants {
  static const String appName = 'Wakaluxe';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Wakaluxe';
  static const String mapboxPublicApiKey =
      'pk.eyJ1IjoiY2hlbjIzNyIsImEiOiJja3pxczBzeW0zdXQwMnBucmpoczlnejM3In0.AMtu9V5Qb-Uzx4UDH6anKQ';
  static const String mapboxSecretApiKey =
      'sk.eyJ1IjoiY2hlbjIzNyIsImEiOiJjbGs0MzZ5MWEwMHkxM3FudHNibTkxNmlwIn0.KjL_GfTjwo6ZmZ6ly3RNIA';
  static const String androidGoogleMapKey =
      'AIzaSyCrJaRKpo96CK8D7LDPSGl_mVvmSQ7CpKc';
  static const String iosGoogleMapKey =
      'AIzaSyBZOIpGjTHWn8vNwGtfRBlSzYj1KOCY06Q';
  static const String baseUrl = 'https://api.wakaluxe.com';
  static const double borderRadius = 14;
  static const double buttonHeight = 52;

  //static const String baseUrl = 'https://wakaluxe.herokuapp.com/api/v1';

  static const String onBoard1 = 'assets/illustrations/onboard1.svg';
  static const String onBoard2 = 'assets/illustrations/onboard2.svg';
  static const String onBoard3 = 'assets/illustrations/onboard3.svg';

  static const String profile = 'assets/images/profile.png';
  static const String driver = 'assets/images/driver.png';
  static const String chat = 'assets/images/chat.png';
  static const String chatBackground = 'assets/images/Chat_wallpaper.jpg';
  static const String searchData = 'assets/images/Searching_data.jpg';
  static const String forgotPassword =
      'assets/illustrations/Forgot_password_bro.svg';
  static const String newPassword = 'assets/illustrations/Secure_login_bro.svg';
  static const String facebookAsset = 'assets/icons/Facebook.svg';
  static const String appleAsset = 'assets/icons/apple.svg';
  static const String googleAsset = 'assets/icons/google.svg';
  static const String bookAsset = 'assets/illustrations/book.svg';
  static const String closeIcon = 'assets/icons/hicon/bold/close.svg';
  static const String locationIcon = 'assets/icons/hicon/linear/location.svg';
  static const String hideIcon = 'assets/icons/hicon/linear/Hide.svg';
  static const String showIcon = 'assets/icons/hicon/linear/Show.svg';
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
  static const String textIcon = '/assets/icons/hicon/linear/text.svg';
  static const String orangeMoneyIcon = 'assets/icons/orange_money.svg';
  static const String mtnMoneyIcon = 'assets/icons/mtn_momo.svg';
  static const String moreSquareIcon =
      'assets/icons/hicon/linear/more_square.svg';
  static const String masterCardIcon = 'assets/icons/mastercard.svg';
  static const String starIcon = 'assets/icons/hicon/linear/Star_2.svg';
  static const String profileIcon =
      'assets/icons/hicon/linear/Profile_Octagon.svg';
  static const String notificationIcon =
      'assets/icons/hicon/linear/Notification_3.svg';
  static const String logoutIcon = 'assets/icons/hicon/linear/Logout.svg';
  static const String subscriptionIcon =
      'assets/icons/hicon/linear/Ticket_1.svg';
  static const String walletIcon = 'assets/icons/hicon/linear/Wallet.svg';
  static const String editIcon = 'assets/icons/hicon/linear/Edit_2.svg';
  static const String editSquareIcon =
      'assets/icons/hicon/linear/Edit_Square.svg';
  static const String mailIcon = 'assets/icons/hicon/linear/Message_36.svg';
  static const String passwordIcon = 'assets/icons/hicon/linear/Password_4.svg';
  static const String visibleIcon = 'assets/icons/hicon/linear/Show.svg';
  static const String notVisibleIcon = 'assets/icons/hicon/linear/Hide.svg';
  static const String hashtagIcon = 'assets/icons/hicon/linear/Hashtag.svg';
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

  Color color(BuildContext context) {
    switch (this) {
      case TripState.upcoming:
        return context.colorScheme.surfaceTint;
      case TripState.completed:
        return context.colorScheme.tertiary;
      case TripState.cancelled:
        return context.colorScheme.error;
      case TripState.pending:
        return context.colorScheme.primary;
      default:
        return context.colorScheme.outline;
    }
  }
}
