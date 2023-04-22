part of 'home_bloc.dart';

class HomeState {
  HomeState({required this.selectedIndex});

  final int selectedIndex;
}

class HomeInitial extends HomeState {
  HomeInitial() : super(selectedIndex: -1);
}

class SelectRideState extends HomeState {
  SelectRideState(int selectedValue) : super(selectedIndex: selectedValue);
}
