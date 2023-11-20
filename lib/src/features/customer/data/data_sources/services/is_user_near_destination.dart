import 'dart:async';
import 'dart:math' show asin, cos, pi, sqrt;

import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';

bool isUserNearDestination(
  int distance,
) {
/*   logInfo(
      'user location: ${userLocation.latitude}, ${userLocation.longitude} and destination location: ${destinationLocation.latitude}, ${destinationLocation.longitude}');
  final distance = calculateDistance(userLocation, destinationLocation);
  logInfo('distance: $distance'); */
  return distance <= 50;
}

double calculateDistance(LocationEntity locA, LocationEntity locB) {
  final lat1 = locA.latitude;
  final lon1 = locA.longitude;
  final lat2 = locB.latitude;
  final lon2 = locB.longitude;
  const p = 0.017453292519943295;
  const c = cos;
  final a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
/* 
void startPeriodicCheck(
  LocationEntity userLocation,
  LocationEntity destinationLocation,
) {
  Timer.periodic(const Duration(seconds: 5), (timer) async {
    final isNear = isUserNearDestination(userLocation, destinationLocation);
    if (isNear) {
      timer.cancel();
      print('User is near the destination.');
    }
  });
} */
