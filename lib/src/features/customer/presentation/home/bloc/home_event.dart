part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

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
