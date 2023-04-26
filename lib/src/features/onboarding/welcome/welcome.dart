import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return Scaffold(
          //backgroundColor: context.scheme.background,
          appBar: AppBar(
            title: const Text('Wakaluxe Widgets'),
            actions: [
              CupertinoSwitch(
                value: state,
                activeColor: context.scheme.tertiary,
                onChanged: (theme) {
                  state == true
                      ? context.read<ThemeCubit>().reset()
                      : context.read<ThemeCubit>().toggle();
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Typograpgy(),
                  Divider(),
                  IconButtons(),
                  Divider(),
                  Buttons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class IconButtons extends StatelessWidget {
  const IconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Icon Buttons',
          style: context.bodyLg.copyWith(
            color: context.scheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WakaluxeBoxedIcon(
              icon: Hicons.information_square,
            ),
            WakaluxeBoxedIcon(
              icon: Hicons.gift_2,
              color: context.scheme.primary,
            ),
            WakaluxeBoxedIcon(
              icon: Hicons.wallet,
              color: context.scheme.secondary,
            ),
            WakaluxeBoxedIcon(
              icon: Hicons.send_2,
              color: context.scheme.tertiary,
            ),
          ],
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Wakaluxe Buttons',
          style: context.bodyLg.copyWith(
            color: context.scheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        12.vGap,
        const WakaluxeButton(
          text: 'Primary',
          //color: context.scheme.primary,
        ),
        12.vGap,
        WakaluxeButton(
          text: 'Secondary',
          color: context.scheme.secondary,
        ),
        12.vGap,
        WakaluxeButton(
          text: 'Tertiary',
          color: context.scheme.tertiary,
        ),
        12.vGap,
        WakaluxeButton(
          text: 'With icon',
          icon: Hicons.send_2,
          color: context.scheme.primary,
        ),
        12.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            WakaluxeButtonMedium(
              text: 'Medium',
            ),
            WakaluxeButtonMedium(
              text: 'Medium',
              icon: Hicons.send_2,
            ),
          ],
        ),
      ],
    );
  }
}

class Typograpgy extends StatelessWidget {
  const Typograpgy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Wakaluxe Typography',
          // style: context.bodyLg.copyWith(
          //   color: context.scheme.onBackground,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        12.vGap,
        Text(
          'Tile Large',
          style: context.titleLg,
        ),
        12.vGap,
        Text(
          'Body Large',
          style: context.bodyLg,
        ),
        12.vGap,
        Text(
          'Body Medium',
          style: context.bodyMd,
        ),
        12.vGap,
        Text(
          'Body Small',
          style: context.bodySm,
        ),
        12.vGap,
      ],
    );
  }
}
