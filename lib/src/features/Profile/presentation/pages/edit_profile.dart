// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wakaluxe/src/common/Utils/helpers.dart';
import 'package:wakaluxe/src/common/Utils/validator.dart';

import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/Profile/presentation/widgets/edit_button.dart';

@RoutePage()
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const String routeName = '/edit-profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _otpController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _otpController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: WakaluxBackhButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70.r,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    backgroundImage: AssetImage(Constants.profile),
                  ),
                  GestureDetector(
                    onTap: _handleProfilePicChange,
                    child: Container(
                      child: SvgPicture.asset(Constants.editIcon),
                    ),
                  )
                ],
              ),
              40.h.vGap,
              Text(
                'Full Name',
                style: t.label,
              ),
              5.h.vGap,
              WakaluxInputField(
                hint: 'Ngome James',
                radius: 10.r,
                text: t,
                controller: _nameController,
              ),
              20.h.vGap,
              Text(
                'Phone Number',
                style: t.label,
              ),
              5.h.vGap,
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: WakaluxInputField(
                      hint: '+612345678',
                      radius: 10.r,
                      formatter: [phoneFormatter],
                      validator: phoneNumberValidator,
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      text: t,
                    ),
                  ),
                  10.w.hGap,
                  Expanded(
                    child: WakaluxEditButton(
                      t: t,
                      text: 'OTP Code',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              20.h.vGap,
              Text('OTP', style: t.label),
              5.h.vGap,
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: WakaluxInputField(
                      hint: '416903',
                      radius: 10.r,
                      formatter: [otpFormatter],
                      validator: otpValidator,
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      text: t,
                    ),
                  ),
                  10.w.hGap,
                  Expanded(
                    child: WakaluxEditButton(
                      t: t,
                      text: 'Verify',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              20.h.vGap,
              Text(
                'Email',
                style: t.label,
              ),
              5.h.vGap,
              WakaluxInputField(
                hint: 'customer@gmail.com',
                radius: 10.r,
                text: t,
                validator: emailValidator,
              ),
              const Spacer(),
              WakaluxeButton(
                text: 'Apply',
                textColor: context.scheme.onSecondary,
                action: _handleSubmit,
                color: context.scheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _showDialog();
    }
  }

  void _handleProfilePicChange(){

  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('OTP Code'),
        content: Text('Enter the OTP code sent to your phone number'),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Verify'),
          ),
        ],
      ),
    );
  }
}
