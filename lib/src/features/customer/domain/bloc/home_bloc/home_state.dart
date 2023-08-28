// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  HomeState({
    required this.selectedIndex,
    required this.selectedPaymentType,
    required this.selectedPaymentMethod,
    required this.selectDriver,
    required this.showDrivers,
    required this.showBookingDetails,
    required this.selectedReview,
    required this.onTrip,
    required this.getDirections,
    required this.payfare,
    required this.lat,
    required this.lng,
    required this.loadingDrivers,
    required this.myCoordinate,
  });
  final int selectedIndex;
  final int selectedPaymentType;
  final int selectedPaymentMethod;
  final bool selectDriver;
  final bool showDrivers;
  final bool showBookingDetails;
  final int selectedReview;
  final bool onTrip;
  final bool getDirections;
  final bool payfare;
  final double lat;
  final double lng;
  final bool loadingDrivers;
  final LocationEntity myCoordinate;

  HomeState copyWith({
    int? selectedIndex,
    int? selectedPaymentType,
    int? selectedPaymentMethod,
    bool? selectDriver,
    bool? showDrivers,
    bool? showBookingDetails,
    int? selectedReview,
    bool? onTrip,
    bool? getDirections,
    bool? payfare,
    double? lat,
    double? lng,
    bool? loadingDrivers,
    LocationEntity? myCoordinate,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedPaymentType: selectedPaymentType ?? this.selectedPaymentType,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectDriver: selectDriver ?? this.selectDriver,
      showDrivers: showDrivers ?? this.showDrivers,
      showBookingDetails: showBookingDetails ?? this.showBookingDetails,
      selectedReview: selectedReview ?? this.selectedReview,
      onTrip: onTrip ?? this.onTrip,
      getDirections: getDirections ?? this.getDirections,
      payfare: payfare ?? this.payfare,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      loadingDrivers: loadingDrivers ?? this.loadingDrivers,
      myCoordinate: myCoordinate ?? this.myCoordinate,
    );
  }
}

class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          selectedIndex: -1,
          selectedPaymentType: -1,
          selectedPaymentMethod: -1,
          selectDriver: false,
          showDrivers: false,
          showBookingDetails: false,
          selectedReview: -1,
          onTrip: false,
          getDirections: false,
          payfare: false,
          lat: 0,
          lng: 0,
          loadingDrivers: false,
          myCoordinate: LocationEntity(latitude: 0, longitude: 0),
        );
}

class SelectRideState extends HomeState {
  SelectRideState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class SelectPaymentTypeState extends HomeState {
  SelectPaymentTypeState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class SelectPaymentMethodState extends HomeState {
  SelectPaymentMethodState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class SelectDriverState extends HomeState {
  SelectDriverState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class ShowDriverState extends HomeState {
  ShowDriverState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class ShowBookingDetailsState extends HomeState {
  ShowBookingDetailsState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class SelectReviewState extends HomeState {
  SelectReviewState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class ShowLocationPickerState extends HomeState {
  ShowLocationPickerState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
    required super.myCoordinate,
  });
}

class HomeInitialErrorState extends HomeState {
  HomeInitialErrorState({
    required super.selectedIndex,
    required super.selectedPaymentType,
    required super.selectedPaymentMethod,
    required super.selectDriver,
    required super.showDrivers,
    required super.showBookingDetails,
    required super.selectedReview,
    required super.onTrip,
    required super.getDirections,
    required super.payfare,
    required super.myCoordinate,
    required super.lat,
    required super.lng,
    required super.loadingDrivers,
  });
}
