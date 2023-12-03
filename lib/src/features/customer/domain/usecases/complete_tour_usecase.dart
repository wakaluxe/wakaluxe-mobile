import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class CompleteTourUsecase extends UseCase<void, CompleteTourParams> {
  CompleteTourUsecase({
    required this.repository,
  });
  final TripRepository repository;
  @override
  Future<void> call(
     CompleteTourParams params,
  ) async {
    return repository.markTourAsComplete(
      tourId: params.tourId,
    );
  }
}

class CompleteTourParams {
  CompleteTourParams({
    required this.tourId,
  });
  final String tourId;
}
