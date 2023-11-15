// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/features/customer/data/models/api_tour_model.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';

import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/create_tour_usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/get_current_location_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._locationUsecase,
    this._createTourUsecase,
    // this._travelTimeUsecase,
  ) : super(HomeInitial()) {
    on<HomeInitialEvent>(_onAuthInitEvent);
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
          myCoordinate: state.myCoordinate,
          showDestionPicker: state.showDestionPicker,
          tourData: state.tourData,
          destination: state.destination,
          source: state.source,
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
          myCoordinate: state.myCoordinate,
          showDestionPicker: state.showDestionPicker,
          tourData: state.tourData,
          destination: state.destination,
          source: state.source,
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
          myCoordinate: state.myCoordinate,
          showDestionPicker: state.showDestionPicker,
          tourData: state.tourData,
          destination: state.destination,
          source: state.source,
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
          myCoordinate: state.myCoordinate,
          showDestionPicker: state.showDestionPicker,
          tourData: state.tourData,
          destination: state.destination,
          source: state.source,
        ),
      );
    });

    on<ShowDriversEvent>((event, emit) {
      // Future.delayed(const tourData(seconds: 4), () {
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
          myCoordinate: state.myCoordinate,
          showDestionPicker: state.showDestionPicker,
          tourData: state.tourData,
          destination: state.destination,
          source: state.source,
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
          myCoordinate: state.myCoordinate,
          showDestionPicker: state.showDestionPicker,
          tourData: state.tourData,
          destination: state.destination,
          source: state.source,
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
      await Future.delayed(const Duration(seconds: 2));
      emit(
        HomeInitial().copyWith(
          payfare: true,
        ),
      );
    });

    on<SelectLocationEvent>((event, emit) async {
      try {
        emit(
          HomeInitial().copyWith(
            source: LocationEntity.fromLatLng(event.source),
            destination: LocationEntity.fromLatLng(event.destination),
            loadingDrivers: true,
            showDestionPicker: false,
          ),
          /*      _travelTimeUsecase(
            destination: LocationEntity.fromLatLng(event.destination),
            source: LocationEntity.fromLatLng(event.source)), */
        );
        final data = await _createTourUsecase(
          params: CreateTourParams(
            source: LocationEntity.fromLatLng(event.source),
            destination: LocationEntity.fromLatLng(event.destination),
          ),
        );

        emit(
          HomeInitial().copyWith(
            source: LocationEntity.fromLatLng(event.source),
            destination: LocationEntity.fromLatLng(event.destination),
            loadingDrivers: true,
            showDestionPicker: false,
            tourData: data,
          ),
        );
      } catch (e) {
        logError(e.toString());
        emit(
          HomeInitial(),
        );
      }
    });
  }

  Future<void> _onAuthInitEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final location = await _locationUsecase();
      logInfo(
        'HomeInitialEvent: longitude ${location.longitude} latitude: ${location.latitude}',
      );
      emit(
        HomeInitial().copyWith(myCoordinate: location),
      );
    } catch (e) {
      emit(HomeInitial());
    }
  }

  final GetCurrentLocationUsecase _locationUsecase;
  final CreateTourUsecase _createTourUsecase;
//  final GetTravelTimeUseCase _travelTimeUsecase;
}
