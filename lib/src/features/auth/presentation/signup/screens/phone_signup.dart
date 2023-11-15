import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

@RoutePage(
  name: 'phoneSignUp',
)
class WakaluxePhoneSignUp extends StatefulWidget {
  const WakaluxePhoneSignUp({super.key});

  @override
  State<WakaluxePhoneSignUp> createState() => _WakaluxePhoneSignUpState();
}

class _WakaluxePhoneSignUpState extends State<WakaluxePhoneSignUp> {
  late TextEditingController phoneController;
  late TextEditingController pinController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController = TextEditingController();
    pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final phoneFormatter = MaskTextInputFormatter(
      mask: '+237 ###-##-##-##',
      filter: {'#': RegExp('[0-9]')},
    );
    final pinFormatter = MaskTextInputFormatter(
      mask: '####',
      filter: {'#': RegExp('[0-9]')},
    );

    return Form(
      key: _formKey,
      child: AppBarredScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your Phone Number',
              style: text.display3,
            ),
            10.vGap,
            Text(
              'We will send you a verification code',
              style: text.body1,
            ),
            31.vGap,
            WakaluxInputField(
              text: text,
              hint: '690909090',
              controller: phoneController,
              icon: Constants.hashtagIcon,
              formatter: [phoneFormatter],
            ),
            17.vGap,
            WakaluxInputField(
              text: text,
              hint: 'Pin',
              controller: pinController,
              icon: Constants.passwordIcon,
              obscured: true,
              formatter: [pinFormatter],
            ),
            const Spacer(),
            Center(
              child: WakaluxeButton(
                text: 'Continue',
                action: () => AutoRouter.of(context).pushNamed('/verification'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSignUp() {}
}
