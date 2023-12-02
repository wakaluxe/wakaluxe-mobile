import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class CreateTourUsecase extends UseCase<CreateTourResModel, CreateTourParams> {
  CreateTourUsecase({
    required this.repository,
  });
  final TripRepository repository;
  @override
  Future<CreateTourResModel> call({
     CreateTourParams? params,
  }) async {
    return repository.createTour(
      source: params!.source,
      destination: params.destination,
      destinationAddress: params.destinationAddress,
    );
  }
}

class CreateTourParams {
  CreateTourParams({
    required this.source,
    required this.destination,
    required this.destinationAddress,
  });
  final LocationEntity source;
  final LocationEntity destination;
  final String destinationAddress;
}
