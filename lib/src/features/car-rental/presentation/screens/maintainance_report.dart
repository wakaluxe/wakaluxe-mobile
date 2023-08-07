import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_text_area.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'MaintainanceReport')
class MaintainanceReport extends StatelessWidget {
  const MaintainanceReport({
    @PathParam('carId') required this.carId,
    super.key,
  });
  final String carId;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.vGap,
              Text('Maintainance Report', style: context.titleLgBold),
              20.vGap,
              Text(
                'Give a report of the problem which you fixed, and all what was bought, replaced and the cost.',
                style: context.bodyMd,
              ),
              10.vGap,
              WakaluxInputField(
                hint: 'Subject...',
                text: text,
              ),
              10.vGap,
              WakaluxInputField(
                hint: 'Date and time',
                text: text,
              ),
              10.vGap,
              const WakaluxeTextArea(hintText: 'Report Summary...'),
              10.vGap,
              WakaluxInputField(
                hint: 'Total Cost',
                text: text,
              ),
              20.vGap,
              Align(
                child: WakaluxeButton(
                  text: 'Submit',
                  action: () {
                    context.router.pushNamed('/daily_objectices/:carId');
                  },
                  color: context.colorScheme.tertiary,
                  textColor: context.colorScheme.onTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
