 import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

import '../../../../common/Utils/logger.dart';

Future<void> onEmbeddedRouteEvent(RouteEvent e) async {

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        final progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {}
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        break;
      case MapBoxEvent.route_build_failed:
        break;
      case MapBoxEvent.navigation_running:
      
        break;
      case MapBoxEvent.on_arrival:
        await Future.delayed(const Duration(seconds: 3));
        await MapBoxNavigation.instance.finishNavigation();

        logInfo('on_arrival');
        break;
      case MapBoxEvent.navigation_finished:
        await MapBoxNavigation.instance.finishNavigation();
        logInfo('on_finished');

        break;

      case MapBoxEvent.navigation_cancelled:
        await MapBoxNavigation.instance.finishNavigation();
        break;
      default:
              logInfo('unkwnon navigation event');
      await MapBoxNavigation.instance.finishNavigation();

        break;
    }
  }
