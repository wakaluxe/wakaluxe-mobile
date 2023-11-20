import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class CancelTourUsecase extends UseCase<void, CancelTourParams> {
  CancelTourUsecase({
    required this.repository,
  });
  final TripRepository repository;
  @override
  Future<void> call({
    required CancelTourParams? params,
  }) async {
    return repository.cancelTour(
      tourId: params!.tourId,
    );
  }
}

class CancelTourParams {
  CancelTourParams({
    required this.tourId,
  });
  final String tourId;
}