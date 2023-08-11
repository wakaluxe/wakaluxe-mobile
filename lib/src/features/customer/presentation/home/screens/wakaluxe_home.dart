import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart' as routes;

@RoutePage()
class WakaluxeHome extends StatelessWidget {
  const WakaluxeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        routes.WakaluxeTaxiBooking(),
        routes.WakaluxeCarRent(),
        routes.WakaluxeTrips(),
        routes.WakaluxeUserProfile(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          backgroundColor: context.colorScheme.background,
          surfaceTintColor: context.colorScheme.background,
          indicatorColor: context.colorScheme.primary.withOpacity(.55),
          //labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          // indicatorShape: Sati
          // useLegacyColorScheme: false,
          // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          onDestinationSelected: (dest) => tabsRouter.setActiveIndex(dest),
          selectedIndex: tabsRouter.activeIndex,
          destinations: const [
            NavigationDestination(
              icon: HeroIcon(
                HeroIcons.sparkles,
                style: HeroIconStyle.outline,
                size: 24,
              ),
              label: 'Wakaluxe',
            ),
            NavigationDestination(
              icon: HeroIcon(
                HeroIcons.rocketLaunch,
                style: HeroIconStyle.outline,
                size: 24,
              ),
              label: 'Rent',
            ),
            NavigationDestination(
              icon: HeroIcon(
                HeroIcons.queueList,
                style: HeroIconStyle.outline,
                size: 24,
              ),
              label: 'Trips',
            ),
            NavigationDestination(
              icon: HeroIcon(
                HeroIcons.globeEuropeAfrica,
                style: HeroIconStyle.outline,
                size: 24,
              ),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
