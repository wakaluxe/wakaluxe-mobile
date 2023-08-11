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
          onTrip: state.onTrip,
          getDirections: state.getDirections,
          payfare: state.payfare,
          lat: state.lat,
          loadingDrivers: state.loadingDrivers,
          lng: state.lng,
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
          onTrip: state.onTrip,
          getDirections: state.getDirections,
          payfare: state.payfare,
          lat: state.lat,
          lng: state.lng,
          loadingDrivers: state.loadingDrivers,
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
          onTrip: state.onTrip,
          getDirections: state.getDirections,
          loadingDrivers: state.loadingDrivers,
          payfare: state.payfare,
          lat: state.lat,
          lng: state.lng,
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
          loadingDrivers: state.loadingDrivers,
          selectedReview: state.selectedReview,
          onTrip: state.onTrip,
          getDirections: state.getDirections,
          payfare: state.payfare,
          lat: state.lat,
          lng: state.lng,
        ),
      );
    });

    on<ShowDriversEvent>((event, emit) {
      // Future.delayed(const Duration(seconds: 4), () {
      emit(
        ShowDriverState(
          selectedIndex: state.selectedIndex,
          selectedPaymentType: state.selectedPaymentType,
          selectedPaymentMethod: state.selectedPaymentMethod,
          selectDriver: state.selectDriver,
          showDrivers: event.showDrivers,
          showBookingDetails: state.showBookingDetails,
          selectedReview: state.selectedReview,
          onTrip: state.onTrip,
          loadingDrivers: event.loadingDrivers,
          getDirections: state.getDirections,
          payfare: state.payfare,
          lat: state.lat,
          lng: state.lng,
        ),
      );
      //   });
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
          onTrip: state.onTrip,
          loadingDrivers: state.loadingDrivers,
          getDirections: state.getDirections,
          payfare: state.payfare,
          lat: state.lat,
          lng: state.lng,
        ),
      );
    });
    on<OnTripEvent>((event, emit) async {
      emit(
        HomeInitial().copyWith(
          onTrip: true,
        ), // delay the operation by 5 seconds
      );
      await Future.delayed(const Duration(seconds: 5));
      emit(
        HomeInitial().copyWith(
          getDirections: true,
        ),
      );
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(
        HomeInitial().copyWith(
          payfare: true,
        ),
      );
    });

    on<SelectLocationEvent>((event, emit) {
      emit(
        HomeInitial().copyWith(
          lat: event.lat,
          lng: event.lng,
          loadingDrivers: true,
        ),
      );
    });
  }
}
