import 'package:bloc/bloc.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_home/driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  DriverHomeCubit() : super(const DriverHomeInitial());

  void toogltInitial() {
    emit(const DriverHomeInitial());
  }

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

    await Future<void>.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        userArrived: !state.userArrived,
      ),
    );
  }

  void changeAcceptRide() {
    emit(
      state.copyWith(
        acceptRide: !state.acceptRide,
      ),
    );
  }

  Future<void> toogleStartRide() async {
    emit(
      state.copyWith(
        startRide: !state.startRide,
      ),
    );
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        completedTrip: !state.completedTrip,
      ),
    );
  }
}
