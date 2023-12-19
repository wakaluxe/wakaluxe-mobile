import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wakaluxe/app_observer.dart';
import 'package:wakaluxe/firebase_options.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/local_auser_data.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  final client = StreamChatClient(
    'vq59whjehqv3',
    logLevel: Level.INFO,
  );
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /*  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  } */
  await registerServices();
  Bloc.observer = const AppBlocObserver();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBloc.storage = storage;

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(246, 0, 0, 0),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox<bool>('first_run');
  await Hive.openBox<String>('post_auth_navigation');
  await locator<LocalUSerData>().initialize();
  // await dotenv.load();
  runApp(
    await builder(),
  );
}
