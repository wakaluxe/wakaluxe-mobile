import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wakaluxe/src/features/Profile/data/trip_mock_data.dart';

import 'package:wakaluxe/src/features/Profile/presentation/entities/trip_entity.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripsState> {
  TripCubit() : super(const TripsState());

  Future<void> fetchMyTrips({required int page, DateTime? date}) async {
    emit(state.copyWith(status: TripStatus.loading));
    await Future.delayed(const Duration(seconds: 2), () {
      emit(
        state.copyWith(
          trips: mockTrips,
          status: TripStatus.loaded,
        ),
      );
    });
  }

  Future<void> fetchMyTripsByDate({required int page, DateTime? date}) async {
    emit(state.copyWith(status: TripStatus.loading));
    await Future.delayed(const Duration(seconds: 2), () {
      emit(
        state.copyWith(
          trips: mockTrips,
          status: TripStatus.loaded,
        ),
      );
    });
  }
}
