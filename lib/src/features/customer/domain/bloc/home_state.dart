part of 'home_bloc.dart';

class HomeState {
  HomeState({
    required this.selectedIndex,
    required this.selectedPaymentType,
    required this.selectedPaymentMethod,
    required this.selectDriver,
    required this.showDrivers,
    required this.showBookingDetails,
  });
  final int selectedIndex;
  final int selectedPaymentType;
  final int selectedPaymentMethod;
  final bool selectDriver;
  final bool showDrivers;
  final bool showBookingDetails;
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
  });
}
