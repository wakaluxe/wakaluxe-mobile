// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class GetCurrentLocationUsecase extends UseCase<LocationEntity, void> {
  final TripRepository repository;
  GetCurrentLocationUsecase({
    required this.repository,
  });
  @override
  Future<LocationEntity> call(void params) async {
    // TODO: implement call
    return await repository.getMyLocation();
  }
}
