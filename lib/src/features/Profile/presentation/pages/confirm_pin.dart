import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/subscriptions/features/Subscriptions/presentation/widgets/padded_body.dart';

@RoutePage()
class WakaluxeCreatePin extends StatefulWidget {
  const WakaluxeCreatePin({super.key});

  @override
  State<WakaluxeCreatePin> createState() => _WakaluxeCreatePinState();
}

class _WakaluxeCreatePinState extends State<WakaluxeCreatePin> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).primaryColorDark;

    final defaultPinTheme = PinTheme(
      width: 70.w,
      height: 70.w,
      textStyle: Theme.of(context).textTheme.extraLargeTitle,
      decoration: const BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: PaddedBody(
          body: SizedBox(
            width: 1.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Create a Pin',
                  style: Theme.of(context).textTheme.title,
                ),
                52.h.vGap,
                Center(
                  child: SizedBox(
                    height: 100.h,
                    child: Pinput(
                      pinAnimationType: PinAnimationType.slide,
                      controller: controller,
                      focusNode: focusNode,
                      obscureText: true,
                      obscuringCharacter: '*',
                      defaultPinTheme: defaultPinTheme,
                      cursor: cursor,
                      preFilledWidget: preFilledWidget,
                    ),
                  ),
                ),
                const Spacer(),
                WakaluxeButton(
                  text: 'Confirm',
                  action: () => _openDialog(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Successful',
          style: Theme.of(context).textTheme.display2,
        ),
        content: Text(
          'Pin was created succesfully',
          style: Theme.of(context).textTheme.body1,
        ),
        actions: [
          WakaluxeButton(
            action: () => context.router.pushNamed('/home'),
            text: 'Next',
          )
        ],
      ),
    );
  }
}
