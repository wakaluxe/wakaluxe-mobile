import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) {
      emit(
        HomeInitial(),
      );
    });
    on<SelectedRideEvent>((event, emit) {
      emit(
        SelectRideState(
          selectedIndex: event.selectedIndex,
          selectedPaymentType: state.selectedPaymentType,
          selectedPaymentMethod: state.selectedPaymentMethod,
          selectDriver: state.selectDriver,
          showDrivers: state.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: state.selectedReview,
        ),
      );
    });
    on<SelectPaymentTypeEvent>((event, emit) {
      emit(
        SelectPaymentTypeState(
          selectedIndex: state.selectedIndex,
          selectedPaymentType: event.selectedPaymentType,
          selectedPaymentMethod: state.selectedPaymentMethod,
          selectDriver: state.selectDriver,
          showDrivers: state.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: state.selectedReview,
        ),
      );
    });
    on<SelectPaymentMethodEvent>((event, emit) {
      emit(
        SelectPaymentMethodState(
          selectedIndex: state.selectedIndex,
          selectedPaymentType: state.selectedPaymentType,
          selectedPaymentMethod: event.selectedPaymentMethod,
          selectDriver: state.selectDriver,
          showDrivers: state.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: state.selectedReview,
        ),
      );
    });
    on<SelectDriverEvent>((event, emit) {
      emit(
        SelectDriverState(
          selectedIndex: state.selectedIndex,
          selectedPaymentType: state.selectedPaymentType,
          selectedPaymentMethod: state.selectedPaymentMethod,
          selectDriver: event.selectDriver,
          showDrivers: state.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: state.selectedReview,
        ),
      );
    });

    on<ShowDriversEvent>((event, emit) {
      emit(
        ShowDriverState(
          selectedIndex: state.selectedIndex,
          selectedPaymentType: state.selectedPaymentType,
          selectedPaymentMethod: state.selectedPaymentMethod,
          selectDriver: state.selectDriver,
          showDrivers: event.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: state.selectedReview,
        ),
      );
    });

    on<ShowBookingDetailsEvent>((event, emit) {
      emit(
        HomeInitial().copyWith(
          showBookingDetails: true,
        ),
      );
    });
    on<SelectReviewEvent>((event, emit) {
      emit(
        SelectReviewState(
          selectedIndex: state.selectedIndex,
          selectedPaymentType: state.selectedPaymentType,
          selectedPaymentMethod: state.selectedPaymentMethod,
          selectDriver: state.selectDriver,
          showDrivers: state.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: event.selectedReview,
        ),
      );
    });
  }
}
