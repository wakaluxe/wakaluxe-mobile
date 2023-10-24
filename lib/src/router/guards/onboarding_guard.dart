import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';

class OnBoardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final box = Hive.box<bool>('first_run');
    final isFirstRun = box.get('is_first_run', defaultValue: true) as bool;
    if (isFirstRun) {
      box.put('is_first_run', false);
      resolver.next();
    } else {
      router.pushNamed('/home-2');
    }
  }
}
