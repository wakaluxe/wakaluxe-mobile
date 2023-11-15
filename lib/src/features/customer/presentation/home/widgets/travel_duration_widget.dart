import 'package:flutter/material.dart';

class TravelTimeWidget extends StatelessWidget {
  // travel time in seconds

  TravelTimeWidget({required this.travelTime});
  final int travelTime;

  @override
  Widget build(BuildContext context) {
    var minutes = travelTime ~/ 60;
    var seconds = travelTime % 60;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${minutes}m ${seconds}s',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
