import 'package:flutter/material.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

class EmptyNotificationContent extends StatelessWidget {
  const EmptyNotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Constants.searchData),
        ],
      ),
    );
  }
}
