import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WakaluxeUserProfile extends StatelessWidget {
  const WakaluxeUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wakaluxe User Profile'),
      ),
    );
  }
}
