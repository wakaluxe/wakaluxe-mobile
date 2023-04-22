part of 'home_bloc.dart';

class HomeState {
  HomeState({required this.selectedIndex, required this.selectedPaymentType});
  final int selectedIndex;
  final int selectedPaymentType;
}

class HomeInitial extends HomeState {
  HomeInitial() : super(selectedIndex: -1, selectedPaymentType: -1);
}

class SelectRideState extends HomeState {
  SelectRideState({
    required super.selectedIndex,
    required super.selectedPaymentType,
  });
}

class SelectPaymentTypeState extends HomeState {
  SelectPaymentTypeState({
    required super.selectedIndex,
    required super.selectedPaymentType,
  });
}
