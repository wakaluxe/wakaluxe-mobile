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
  });
  final int selectedIndex;
  final int selectedPaymentType;
  final int selectedPaymentMethod;
  final bool selectDriver;
  final bool showDrivers;
  final bool showBookingDetails;
  final int selectedReview;

  HomeState copyWith({
    int? selectedIndex,
    int? selectedPaymentType,
    int? selectedPaymentMethod,
    bool? selectDriver,
    bool? showDrivers,
    bool? showBookingDetails,
    int? selectedReview,
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
  });
}
