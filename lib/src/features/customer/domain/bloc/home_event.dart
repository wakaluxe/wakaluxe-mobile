part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class SelectedRideEvent extends HomeEvent {
  SelectedRideEvent({required this.selectedIndex});
  final int selectedIndex;
}

class SelectPaymentTypeEvent extends HomeEvent {
  SelectPaymentTypeEvent({required this.selectedPaymentType});
  final int selectedPaymentType;
}

class SelectPaymentMethodEvent extends HomeEvent {
  SelectPaymentMethodEvent({required this.selectedPaymentMethod});
  final int selectedPaymentMethod;
}

class SelectDriverEvent extends HomeEvent {
  SelectDriverEvent({required this.selectDriver});
  final bool selectDriver;
}

class ShowDriversEvent extends HomeEvent {
  ShowDriversEvent({required this.showDrivers});
  final bool showDrivers;
}

class ShowSuccessBookEvent extends HomeEvent {
  ShowSuccessBookEvent({required this.showSuccessBook});
  final bool showSuccessBook;
}

class ShowBookingDetailsEvent extends HomeEvent {
  ShowBookingDetailsEvent();
}

class SelectReviewEvent extends HomeEvent {
  SelectReviewEvent({required this.selectedReview});
  final int selectedReview;
}

class OnTripEvent extends HomeEvent {
  OnTripEvent();
}

class GetDirectionsEvent extends HomeEvent {
  GetDirectionsEvent();
}

class PayFareEvent extends HomeEvent {
  PayFareEvent();
}
