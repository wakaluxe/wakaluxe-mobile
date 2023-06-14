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
  name: 'PhoneNumber',
)
class WakaluxePhoneNumber extends StatefulWidget {
  const WakaluxePhoneNumber({super.key});

  @override
  State<WakaluxePhoneNumber> createState() => _WakaluxePhoneNumberState();
}

class _WakaluxePhoneNumberState extends State<WakaluxePhoneNumber> {
  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final phoneFormatter = MaskTextInputFormatter(
      mask: '+237 ###-##-##-##',
      filter: {'#': RegExp('[0-9]')},
    );

    return AppBarredScaffold(
      body: Column(
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
<<<<<<< HEAD
            //TODO: update icon
            icon: Constants.starIcon,
=======
            icon: Constants.hashtagIcon,
>>>>>>> 5c430bba86ac8f925b88c0faa991c8679432bf5b
            formatter: [phoneFormatter],
          ),
          86.vGap,
          WakaluxeButton(
            text: 'Continue',
            width: 0.4,
            action: () => AutoRouter.of(context).pushNamed('/verification'),
          ),
        ],
      ),
    );
  }
}
