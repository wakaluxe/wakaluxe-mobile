// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/get_current_location_usecase.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetCurrentLocationUsecase _locationUsecase;

  BookingCubit(
    this._locationUsecase,
  ) : super(BookingInitial());

  Future<void> onAppStart() async {
    emit(BookingOnAppStart());
    try {
      final location = await _locationUsecase(null);

      emit(
        BookingOnAppStartSuccess(
          myLocation: LatLng(location.latitude, location.longitude),
        ),
      );
    } catch (e) {
      emit(
        const BookingOnAppStartFailed(
          errorMessage: 'please enable your current location',
        ),
      );
    }
  }

  void changeMyLocation(LatLng location) {
    emit(
      BookingLocationChanged(
        myLocation: location,
      ),
    );
  }

  Future<void> getDirections(LatLng origin, LatLng destination) async {
    emit(BookingGetDirectionInit());

    try {
      final polylinePoints = PolylinePoints();

      final result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.androidGoogleMapKey,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude),
      );

      if (result.points.isNotEmpty) {
        final points =
            result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();

        emit(
          BookingGetDirectionSuccess(
            polyPoints: points,
            hasDirection: true,
            sourceIcon: await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(devicePixelRatio: 2.5),
              'assets/icons/source.png',
            ),
            destinationIcon: await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(devicePixelRatio: 2.5),
              'assets/icons/destination.png',
            ),
          ),
        );
        //   _polylineCoordinates = points;
        //  setState(() {});
      }
    } on Exception {
      emit(
        const BookingGetDirectionFailed(
          errorMessage: "can't get direction",
        ),
      );
    }
  }

  Future<void> getRealTimeLocation() async {
    final location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final controller = state.mapController!;
    location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              event.latitude!,
              event.longitude!,
            ),
            zoom: 14.4746,
          ),
        ),
      );
      emit(
        BookingLocationChanged(
          myLocation: LatLng(event.latitude!, event.longitude!),
        ),
      );
    });
  }

  void onMapCreated(GoogleMapController controller) {
    emit(BookingOnMapCreated(mapController: controller));
    getRealTimeLocation();
  }
}
