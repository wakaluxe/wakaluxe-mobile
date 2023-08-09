import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/promotion_banner.dart';

@RoutePage()
class WakaluxeTaxiBooking extends StatelessWidget {
  const WakaluxeTaxiBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wakaluxe Taxi Booking'),
      ),
      bottomSheet: PromotionBanner(),
    );
  }
}
