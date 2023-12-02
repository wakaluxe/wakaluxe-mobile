// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class SelectedRideEvent extends HomeEvent {
  SelectedRideEvent();
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
  final LatLng source;
  final LatLng destination;
  final String destinationAddress;
  SelectLocationEvent({
    required this.source,
    required this.destination,
    required this.destinationAddress,
  });
}

class CancelTripEvent extends HomeEvent {
  final String tourId;
  CancelTripEvent(
    this.tourId,
  );
}

class CallDriverEvent extends HomeEvent {
  final String phoneNumber;
  CallDriverEvent(
    this.phoneNumber,
  );
}

class CompleteTripEvent extends HomeEvent {
  final String tourId;
  CompleteTripEvent(
    this.tourId,
  );
}

class UpdateUserCoordindateEvent extends HomeEvent {
  final LatLng coordinate;
  UpdateUserCoordindateEvent(this.coordinate);
}
