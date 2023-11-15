// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState({
    this.showDestinationPicker = true,
    this.destination,
    this.origin,
    this.myLocation,
    this.polyPoints = const <LatLng>[],
    this.loadingDrivers = false,
    this.loadingDirections = false,
    this.errorMessage = '',
    this.mapController,
    this.hasDirection = false,
    this.sourceIcon = BitmapDescriptor.defaultMarker,
    this.destinationIcon = BitmapDescriptor.defaultMarker,
  });

  final bool showDestinationPicker;
  final LatLng? destination;
  final LatLng? origin;
  final LatLng? myLocation;
  final List<LatLng> polyPoints;
  final bool loadingDrivers;
  final bool loadingDirections;
  final String errorMessage;
  final GoogleMapController? mapController;
  final BitmapDescriptor sourceIcon;
  final BitmapDescriptor destinationIcon;
  final bool hasDirection;

  @override
  List<Object?> get props => [
        showDestinationPicker,
        destination,
        origin,
        myLocation,
        loadingDirections,
        loadingDrivers,
        polyPoints,
        errorMessage,
        mapController,
        sourceIcon,
        destinationIcon,
        hasDirection
      ];
}

class BookingInitial extends BookingState {}

class BookingOnAppStart extends BookingState {}

class BookingOnAppStartFailed extends BookingState {
  const BookingOnAppStartFailed({required super.errorMessage});
}

class BookingOnAppStartSuccess extends BookingState {
  const BookingOnAppStartSuccess({
    required super.myLocation,
  });
}

class BookingOnMapCreated extends BookingState {
  const BookingOnMapCreated({required super.mapController});
}

class BookingSelectDestinationInit extends BookingState {}

class BookingSelectDestinationFailed extends BookingState {
  const BookingSelectDestinationFailed({required super.errorMessage});
}

class BookingSelectDestinationSuccess extends BookingState {}

class BookingSearchDriverInit extends BookingState {}

class BookingSearchDriverfailed extends BookingState {
  const BookingSearchDriverfailed({required super.errorMessage});
}

class BookingSearchDriverSuccess extends BookingState {}

class BookingGetDirectionInit extends BookingState {}

class BookingGetDirectionFailed extends BookingState {
  const BookingGetDirectionFailed({required super.errorMessage});
}

class BookingGetDirectionSuccess extends BookingState {
  const BookingGetDirectionSuccess({
    required super.polyPoints,
    super.destination,
    super.sourceIcon,
    super.hasDirection,
    super.destinationIcon,
  });
}

class BookingLocationChanged extends BookingState {
  const BookingLocationChanged({required super.myLocation});
}

class BookingRealTimeLocationChanged extends BookingState {
  const BookingRealTimeLocationChanged({
    required super.myLocation,
    required super.mapController,
  });
}

class BookingSelectRideInit extends BookingState {}

class BookingSelectRideFailed extends BookingState {
  const BookingSelectRideFailed({required super.errorMessage});
}

class BookingSelectRideSuccess extends BookingState {}

class BookingAwaitRideInit extends BookingState {}

class BookingAwaitRideFailed extends BookingState {
  const BookingAwaitRideFailed({required super.errorMessage});
}

class BookingAwaitRideCancelled extends BookingState {}

class BookingAwaitRideSuccess extends BookingState {}

class BookingStartRideInit extends BookingState {}

class BookingStartRide extends BookingState {}

class BookingRideFailed extends BookingState {
  const BookingRideFailed({required super.errorMessage});
}

class BookingRideCancelled extends BookingState {}

class BookingRideCompleted extends BookingState {}
