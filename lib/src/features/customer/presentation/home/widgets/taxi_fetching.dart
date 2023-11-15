import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TaxiFetching extends StatelessWidget {
  const TaxiFetching({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(
            'assets/animations/taxi.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          const Text(
            'Finding you a ride...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
