import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
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
            icon: 'assets/Icons/Hicon/Linear/Hashtag.svg',
            formatter: [phoneFormatter],
          ),
          86.vGap,
           WakaluxeButton(
            text: 'Continue',
            width: 0.4,
            action: ()=> AutoRouter.of(context).pushNamed('/verification'),
          ),
        ],
      ),
    );
  }
}
