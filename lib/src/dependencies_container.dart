import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/common/resources/network_connectivity.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/backend_auth_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/local_auser_data.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/customer/data/trip_repository_implemantation.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/get_current_location_usecase.dart';

final locator = GetIt.instance;

Future<void> registerServices() async {
  locator
    ..registerSingleton<Dio>(Dio())
    ..registerLazySingleton<HiveClient>(HiveClient.new)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<AuthRepositorymplementation>(
      AuthRepositorymplementation.new,
    )
    ..registerLazySingleton<LocalUSerData>(LocalUSerData.new)
    ..registerSingleton<BackendAuthDataSource>(
      BackendAuthDataSource(locator()),
    )
    ..registerLazySingleton<NetworkConnectivity>(
      NetworkConnectivity.new,
    )
    ..registerSingleton<TripRepository>(
      TripRepositoryImplementation(),
    )
    ..registerSingleton<GetCurrentLocationUsecase>(
      GetCurrentLocationUsecase(repository: locator()),
    )
    ..registerFactory<HomeBloc>(() => HomeBloc(locator()))
    ..registerFactory<AuthBloc>(() => AuthBloc(locator()));
}
