// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/features/auth/presentation/widgets/app_barred_scaffold.dart';
import 'package:wakaluxe/src/features/onboarding/welcome/page_view_model.dart';

@RoutePage(name: 'welcome')
class Welcome extends StatelessWidget {
  const Welcome({super.key});
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    final text = Theme.of(context).textTheme;

    return AppBarredScaffold(
      body: IntroductionScreen(
        showDoneButton: false,
        dotsDecorator: DotsDecorator(
          size: Size.square(16.r),
          activeSize: const Size(20, 10),
          // activeColor,: context.colorScheme.primary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        pages: [
          wakaluxPageViewModel(
            text: text,
            title: AppLocalizations.of(context).welcomeTitle1,
            body: AppLocalizations.of(context).welcomeBody1,
            image: 'assets/illustrations/onboard1.svg',
          ),
          wakaluxPageViewModel(
            text: text,
            title: AppLocalizations.of(context).welcomeTitle2,
            body:
                AppLocalizations.of(context).welcomeBody2,
            image: 'assets/illustrations/onboard2.svg',
          ),
          wakaluxPageViewModel(
            text: text,
            title: AppLocalizations.of(context).welcomeTitle1,
            body:
                AppLocalizations.of(context).welcomeBody3,
            end: true,
            context: context,
            image: 'assets/illustrations/onboard3.svg',
          ),
        ],
        showNextButton: false,
      ),
    );
  }
}

// class IconButtons extends StatelessWidget {
//   const IconButtons({
//     super.key,
//     required this.scaffoldKey,
//   });
//   final GlobalKey<ScaffoldState> scaffoldKey;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Icon Buttons',
//           style: context.bodyLg.copyWith(
//             color: context.colorScheme.onBackground,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             WakaluxeBoxedIcon(
//               icon: Hicons.gift_2,
//               color: context.colorScheme.tertiary,
//             ),
//             WakaluxeBoxedIcon(
//               icon: Hicons.wallet,
//               color: context.colorScheme.secondary,
//             ),
//             WakaluxeBoxedIcon(
//               icon: Hicons.send_2,
//               color: context.colorScheme.tertiary,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class Buttons extends StatelessWidget {
//   const Buttons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Wakaluxe Buttons',
//           style: context.bodyLg.copyWith(
//             color: context.colorScheme.onBackground,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         12.vGap,
//         const WakaluxeButton(
//           text: 'Primary',
//           //color: context.colorScheme.primary,
//         ),
//         12.vGap,
//         WakaluxeButton(
//           text: 'Secondary',
//           color: context.colorScheme.secondary,
//         ),
//         12.vGap,
//         WakaluxeButton(
//           text: 'Tertiary',
//           color: context.colorScheme.tertiary,
//         ),
//         12.vGap,
//         WakaluxeButton(
//           text: 'With icon',
//           icon: Hicons.send_2,
//           color: context.colorScheme.tertiary,
//         ),
//         12.vGap,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: const [
//             WakaluxeButtonMedium(
//               text: 'Medium',
//             ),
//             WakaluxeButtonMedium(
//               text: 'Medium',
//               icon: Hicons.send_2,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class Typograpgy extends StatelessWidget {
//   const Typograpgy({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Wakaluxe Typography',
//           style: context.bodyLg.copyWith(
//             color: context.colorScheme.onBackground,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         12.vGap,
//         Text(
//           'Tile Large',
//           style: context.titleLg,
//         ),
//         12.vGap,
//         Text(
//           'Body Large',
//           style: context.bodyLg,
//         ),
//         12.vGap,
//         Text(
//           'Body Medium',
//           style: context.bodyMd,
//         ),
//         12.vGap,
//         Text(
//           'Body Small',
//           style: context.bodySm,
//         ),
//         12.vGap,
//       ],
//     );
//   }
// }
