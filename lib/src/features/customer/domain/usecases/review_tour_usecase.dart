import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';

class ReviewTourUseCase extends UseCase<void, ReviewTourParams> {
  ReviewTourUseCase(this.repository);
  final TripRepository repository;

  @override
  Future<void> call( ReviewTourParams params) async {
    return await repository.reviewTrip(
      tourId: params.tourId,
      rating: params.rating,
      review: params.review,
    );
  }
}

class ReviewTourParams {
  ReviewTourParams({
    required this.tourId,
    required this.rating,
    required this.review,
  });
  final String tourId;
  final double rating;
  final String review;
}
