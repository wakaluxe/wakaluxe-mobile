import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'DriverLogin')
class DriverLogin extends StatelessWidget {
  const DriverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            10.vGap,
            Text(' Log in to your driver account', style: context.bodyMd),
          ],
        ),
      ),
    );
  }
}
