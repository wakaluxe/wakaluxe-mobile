import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
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
        return BottomNavigationBar(
          useLegacyColorScheme: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_taxi,
                // color: context.colorScheme.onBackground,
              ),
              label: 'Taxi',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.car_rental,
                // color: context.colorScheme.onBackground,
              ),
              label: 'Car Rent',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Hicons.hide,
                //color: context.colorScheme.onBackground,
              ),
              label: 'Trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Hicons.profile_1,
                //color: context.colorScheme.onBackground,
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
