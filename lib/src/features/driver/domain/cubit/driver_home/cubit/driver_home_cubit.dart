import 'package:bloc/bloc.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_home/cubit/driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  DriverHomeCubit() : super(const DriverHomeInitial());

  void toogleIsOnLine() {
    emit(
      state.copyWith(
        isOnline: !state.isOnline,
      ),
    );
    emit(
      state.copyWith(
        newOrder: !state.newOrder,
      ),
    );
  }

  Future<void> toggleAcceptRide() async {
    emit(
      state.copyWith(
        newOrder: !state.newOrder,
      ),
    );

    emit(
      state.copyWith(
        acceptRide: !state.acceptRide,
      ),
    );

    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        userArrived: !state.userArrived,
      ),
    );
  }

  void toogleStartRide() {
    emit(
      state.copyWith(
        startRide: !state.startRide,
      ),
    );
    emit(
      state.copyWith(
        completedTrip: !state.completedTrip,
      ),
    );
  }
}
