part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SelectedRideEvent extends HomeEvent {
  SelectedRideEvent({required this.selectedIndex});
  final int selectedIndex;
}
