import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/configs/palette.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';
import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';
import 'package:wakaluxe/src/features/onboarding/welcome/page_view_model.dart';

@RoutePage(name: 'welcome')
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    final text = Theme.of(context).textTheme;

    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return AppBarredScaffold(
          body: IntroductionScreen(
            showDoneButton: false,
            dotsDecorator: DotsDecorator(
              size: Size.square(16.r),
              activeSize: const Size(20, 10),
              activeColor: Palette.primary,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            pages: [
              wakaluxPageViewModel(
                text: text,
                title: 'Request a ride',
                body:
                    'Request for a ride and get picked up by a near by driver.',
                image: 'assets/Illustrations/onboard1.svg',
              ),
              wakaluxPageViewModel(
                text: text,
                title: 'Confirm your driver',
                body:
                    'Select from a wide network of Community drivers near you and get a rideto destination.',
                image: 'assets/Illustrations/onboard2.svg',
              ),
              wakaluxPageViewModel(
                text: text,
                title: 'Track your ride',
                body:
                    'Get some progress updates on the selected driver who is to pick you up and also follow up your rides progress to your final destination.',
                end: true,
                context: context,
                image: 'assets/Illustrations/onboard3.svg',
              ),
            ],
            showNextButton: false,
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
