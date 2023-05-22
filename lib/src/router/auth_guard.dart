import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (false) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      router.push(
        
      );
    }
  }
}
