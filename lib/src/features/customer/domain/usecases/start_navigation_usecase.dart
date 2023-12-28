import 'package:equatable/equatable.dart';
import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class StartNavigationUsecase extends UseCase<void, StartNavigationParams> {
  StartNavigationUsecase(this.repository);
  final TripRepository repository;

  @override
  Future<void> call(StartNavigationParams params) async {
    return await repository.startNavigation(
      params.source,
      params.destination,
      params.onArrival,
      params.onCancel,
    );
  }
}

class StartNavigationParams extends Equatable {
  const StartNavigationParams({
    required this.source,
    required this.destination,
    required this.onArrival,
    required this.onCancel,
  });
  final LocationEntity source;
  final LocationEntity destination;
  final void Function() onArrival;
  final void Function() onCancel;

  @override
  List<Object?> get props => [source, destination, onArrival, onCancel];
}
