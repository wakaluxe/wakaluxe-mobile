// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  ShowDriversEvent({
    required this.showDrivers,
    required this.loadingDrivers,
  });
  final bool showDrivers;
  final bool loadingDrivers;
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

class SelectLocationEvent extends HomeEvent {
final   double lat;
 final double lng;
  SelectLocationEvent({
    required this.lat,
    required this.lng,
  });
}
