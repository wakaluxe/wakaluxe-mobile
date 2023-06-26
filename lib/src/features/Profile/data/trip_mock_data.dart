import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/Profile/presentation/entities/trip_entity.dart';

List<TripEntity> mockTrips = [
  TripEntity(
    id: '1',
    destination: 'Trip to Paris',
    pickUp: 'Paris',
    state: TripState.completed,
  ),
  TripEntity(
    id: '2',
    destination: 'Omnisport',
    pickUp: 'ngousso',
    state: TripState.pending,
  ),
  TripEntity(
    id: '3',
    destination: 'etoudi',
    pickUp: 'manguier',
    state: TripState.completed,
  ),
  TripEntity(
    id: '4',
    destination: 'Essos',
    pickUp: 'Post Central',
    state: TripState.cancelled,
  ),
  TripEntity(
    id: '5',
    destination: 'biyemassi',
    pickUp: 'ngoa ekele',
    state: TripState.completed,
  )
];
