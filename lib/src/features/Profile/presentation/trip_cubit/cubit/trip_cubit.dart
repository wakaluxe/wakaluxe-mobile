// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';

import 'package:wakaluxe/src/features/Profile/data/trip_mock_data.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/get_trips_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/get_trips_usecase.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripsState> {
  TripCubit(
    this.getTripsUsecase,
  ) : super(const TripsState());

  Future<void> fetchMyTrips({required int page, DateTime? date}) async {
    emit(state.copyWith(status: TripStatus.loading));
    try {
      await getTripsUsecase().then((value) {
        emit(
          state.copyWith(
            trips: value,
            status: TripStatus.loaded,
          ),
        );
      });
    } catch (e) {
      logError('the error in fetch my trips $e');
      emit(
        state.copyWith(
          status: TripStatus.error,
        ),
      );
    }
    /*  await Future.delayed(const Duration(seconds: 2), () {
      emit(
        state.copyWith(
          trips: mockTrips,
          status: TripStatus.loaded,
        ),
      );
    }); */
  }

  Future<void> fetchMyTripsByDate({required int page, DateTime? date}) async {
    emit(state.copyWith(status: TripStatus.loading));
    /*   await Future.delayed(const Duration(seconds: 2), () {
      emit(
        state.copyWith(
          trips: mockTrips,
          status: TripStatus.loaded,
        ),
      );
    }); */
  }

  final GetTripsUsecase getTripsUsecase;
}
