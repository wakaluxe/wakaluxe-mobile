import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_text_area.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'StatusReport')
class StatusReport extends StatelessWidget {
  const StatusReport({@PathParam('carId') required this.carId, super.key});
  final String carId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.vGap,
            Text('Car Status Report', style: context.titleLgBold),
            20.vGap,
            Text(
              'What was the state of the car the first time you collected it',
              style: context.bodyMd,
            ),
            5.vGap,
            const WakaluxeTextArea(hintText: 'Report Summary...'),
            const Spacer(),
            Align(
              child: WakaluxeButton(
                text: 'Submit',
                action: () {
                  context.router.pushNamed('/maintainance_report/:carId');
                },
                color: context.colorScheme.tertiary,
                textColor: context.colorScheme.onTertiary,
              ),
            ),
            20.vGap,
          ],
        ),
      ),
    );
  }
}
