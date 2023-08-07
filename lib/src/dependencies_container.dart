import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/features/auth/data/firebase_auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/local_auser_data.dart';

final locator = GetIt.instance;

Future<void> registerServices() async {
  //check if user logged in or not
  locator.registerLazySingleton<HiveClient>(() => HiveClient());
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseAuthRepository>(
      () => FirebaseAuthRepository());
  locator.registerLazySingleton<LocalUSerData>(() => LocalUSerData());
}
