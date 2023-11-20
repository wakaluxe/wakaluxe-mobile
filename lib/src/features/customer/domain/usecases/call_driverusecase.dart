import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class CallDriverUsecase extends UseCase<void, CallDriverParams> {
  CallDriverUsecase({
    required this.repository,
  });
  final TripRepository repository;
  @override
  Future<void> call({
    required CallDriverParams? params,
  }) async {
    return repository.callDriver(
      tourId: params!.phoneNumber,
    );
  }
}

class CallDriverParams {
  CallDriverParams({
    required this.phoneNumber,
  });
  final String phoneNumber;
}