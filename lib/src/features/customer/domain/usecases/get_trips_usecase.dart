import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/data/models/get_trips_res_model/get_trips_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class GetTripsUsecase extends UseCase<GetTripsResModel, void> {
  GetTripsUsecase(this.repository);
  final TripRepository repository;

  @override
  Future<GetTripsResModel> call(
     void params,
  ) async {
    return await repository.getTrips();
  }
}
