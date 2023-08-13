import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/firebase_auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/local_auser_data.dart';

final locator = GetIt.instance;

Future<void> registerServices() async {
  //check if user logged in or not
  locator.registerLazySingleton<HiveClient>(HiveClient.new);
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseAuthRepository>(
    FirebaseAuthRepository.new,
  );
  locator.registerLazySingleton<LocalUSerData>(LocalUSerData.new);
}
