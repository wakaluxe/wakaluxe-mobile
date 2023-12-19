import 'package:auto_route/auto_route.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/local_auser_data.dart';

class AuthenticatedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final hasId = locator<LocalUSerData>().getUser()?.hasId;
    

    if (hasId == false || hasId == null) {
      router.pushNamed('/sign-up');
    } else {
      resolver.next();
    }
  }
}
