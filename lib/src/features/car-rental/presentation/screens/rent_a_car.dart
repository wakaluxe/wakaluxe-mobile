import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'RentACar')
class RentACar extends StatelessWidget {
  const RentACar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
