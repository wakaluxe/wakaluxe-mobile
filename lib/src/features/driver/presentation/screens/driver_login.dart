import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_login/driver_login_cubit.dart';
import 'package:wakaluxe/src/features/driver/domain/cubit/driver_login/driver_login_state.dart';

@RoutePage(name: 'DriverLogin')
class DriverLogin extends StatelessWidget {
  const DriverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    //create driverloginCubit
    final cubit = DriverLoginCubit(
      driverIdNoController: TextEditingController(),
      emailPhoneController: TextEditingController(),
      pinController: TextEditingController(),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<DriverLoginCubit, DriverLoginState>(
          bloc: cubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.vGap,
                Text(
                  ' Log in to your driver account',
                  style: context.titleLgBold,
                ),
                20.vGap,
                WakaluxeFormField(
                  hint: 'Email/Phone Number',
                  controller: cubit.emailPhoneController,
                  onChanged: (value) {
                    cubit.onEmailPhoneChanged(value: value);
                  },
                ),
                10.vGap,
                WakaluxeFormField(
                  hint: 'Driver Id No',
                  controller: cubit.driverIdNoController,
                  prefixIcon: const Icon(Icons.ac_unit),
                  onChanged: (value) {
                    cubit.onDriverIdNoChanged(value: value);
                  },
                ),
                10.vGap,
                WakaluxeFormField(
                  hint: 'Enter Pin',
                  controller: cubit.pinController,
                  prefixIcon: const Icon(Icons.pin),
                  onChanged: (value) {
                    cubit.onPinChanged(value: value);
                  },
                  keyboardType: TextInputType.number,
                  isPassword: true,
                  isObscured: state.isVisible,
                  sufixIcon: GestureDetector(
                    onTap: () {
                      cubit.onVisibilityChanged(value: !state.isVisible);
                    },
                    child: Icon(
                      state.isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                const Spacer(),
                WakaluxeButton(
                  text: 'Login',
                  color: context.scheme.tertiary,
                  textColor: context.scheme.onTertiary,
                  action: () {
                    context.router.pushNamed('/driver_home');
                  },
                ),
                40.vGap
              ],
            );
          },
        ),
      ),
    );
  }
}
