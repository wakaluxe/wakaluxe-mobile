import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

class OnTripWidget extends StatelessWidget {
  const OnTripWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: WakaluxCard(
        child: WakaluxeOnTrip(
          driverImage: Constants.driver,
          driverName: 'Ayuko Peters',
          rating: 4,
        ),
      ),
    );
  }
}
