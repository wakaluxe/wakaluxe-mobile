part of 'trip_cubit.dart';

enum TripStatus { initial, loading, loaded, error }

class TripsState extends Equatable {
  const TripsState({
    this.trips = const [],
    this.message = '',
    this.status = TripStatus.initial,
  });
  final List<TripEntity> trips;
  final String message;
  final TripStatus status;

  TripsState copyWith({
    List<TripEntity>? trips,
    String? message,
    TripStatus? status,
  }) {
    return TripsState(
      trips: trips ?? this.trips,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [ trips, message, status];
}

