import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/features/car-rental/domain/bloc/view_car_state.dart';

class ViewCarCubit extends Cubit<ViewCarState> {
  ViewCarCubit({this.initialIndex})
      : super(
          ViewCarState(selectedIndex: initialIndex ?? -1),
        );

  final int? initialIndex;

  void onCardClicked(int value) {
    emit(
      state.copyWith(
        selectedIndex: value,
      ),
    );
  }
}
