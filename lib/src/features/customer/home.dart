import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'Home')
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.onBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  //  remove and replace with hamburger icon
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: context.scheme.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.menu,
                        color: context.scheme.onBackground,
                      ),
                    ),
                  ),
                  8.hGap,
                  Expanded(
                    flex: 4,
                    child: LocationWidget(
                      leading: Icon(
                        Icons.person,
                        color: context.scheme.primary,
                      ),
                      trainling: Icon(
                        Icons.close,
                        color: context.scheme.onBackground,
                      ),
                      message: context.l10n.locationCoordinates,
                      onTap: () {
                        debugPrint('Testing out');
                      },
                    ),
                  ),
                  8.hGap,
                  const Expanded(
                    child: ProfileImage(
                      imageUrl: 'https://placeimg.com/640/480/any',
                    ),
                  ),
                ],
              ),
              20.vGap,

            ],
          ),
        ),
      ),
    );
  }
}
