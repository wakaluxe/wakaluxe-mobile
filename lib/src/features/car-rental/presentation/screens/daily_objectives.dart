import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'DailyObjectives')
class DailyObjectives extends StatelessWidget {
  const DailyObjectives({
    @PathParam('carId') required this.carId,
    super.key,
  });
  final String carId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.vGap,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text('Daily Objectives', style: context.titleLgBold),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Check water level', style: context.bodyMd),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Check oil level', style: context.bodyMd),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Check coolant level', style: context.bodyMd),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
