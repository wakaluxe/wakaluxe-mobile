import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/padded_body.dart';

@RoutePage(
)
class EnterFullName extends StatefulWidget {
  const EnterFullName({super.key});

  @override
  State<EnterFullName> createState() => _EnterFullNameState();
}

class _EnterFullNameState extends State<EnterFullName> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: PaddedBody(
        body: Column(
          children: <Widget>[
            Text('Enter your name', style: textTheme.headline,),
            13.h.vGap,
            Text('Please enter your full names below', style: textTheme.body1,),
            WakaluxInputField(
              text: textTheme,
              hint: 'Full Name',
              icon: Constants.textIcon,
            
            ),
            const Spacer(),
            WakaluxeButton(text: 'Confirm', action:() => context.router.pushNamed('/home'),),
          ],
        ),
      ),
    );
  }
}
