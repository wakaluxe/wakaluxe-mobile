import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/customer/data/models/api_tour_model.dart';

CreateTourApiResModel getTourPrice(CreateTourApiResModel data) {
  final distanceInKm = data.distanceValue / 1000;
  final durationInMinutes = data.durationValue / 60;

  final price = Constants.baseFare +
      (Constants.costPerKm * distanceInKm) +
      (Constants.costPerMinute * durationInMinutes);

  return data.copyWith(price: price);
}
