// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DriverHomeState extends Equatable {
  const DriverHomeState({
    required this.newOrder,
    required this.isOnline,
    required this.acceptRide,
    required this.startRide,
    required this.userArrived,
    required this.completedTrip,
  });
  final bool isOnline;
  final bool acceptRide;
  final bool startRide;
  final bool userArrived;
  final bool newOrder;
  final bool completedTrip;

  DriverHomeState copyWith({
    bool? isOnline,
    bool? acceptRide,
    bool? startRide,
    bool? userArrived,
    bool? completedTrip,
    bool? newOrder,
  }) {
    return DriverHomeState(
      isOnline: isOnline ?? this.isOnline,
      acceptRide: acceptRide ?? this.acceptRide,
      startRide: startRide ?? this.startRide,
      userArrived: userArrived ?? this.userArrived,
      completedTrip: completedTrip ?? this.completedTrip,
      newOrder: newOrder ?? this.newOrder,
    );
  }

  @override
  List<Object> get props {
    return [
      isOnline,
      acceptRide,
      startRide,
      userArrived,
      completedTrip,
      newOrder,
    ];
  }
}

class DriverHomeInitial extends DriverHomeState {
  const DriverHomeInitial()
      : super(
          isOnline: true,
          acceptRide: false,
          startRide: false,
          userArrived: false,
          completedTrip: true,
          newOrder: false,
        );
}
