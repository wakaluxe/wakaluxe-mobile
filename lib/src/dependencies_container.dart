import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/common/resources/network_connectivity.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/backend_auth_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/local_auser_data.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:wakaluxe/src/features/customer/data/data_sources/tour_backend_data_source.dart';
import 'package:wakaluxe/src/features/customer/data/trip_repository_implemantation.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/trip_repository.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/call_driver_usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/cancel_tour_usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/complete_tour_usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/create_tour_usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/get_current_location_usecase.dart';
import 'package:wakaluxe/src/features/customer/domain/usecases/get_trips_usecase.dart';

final locator = GetIt.instance;

Future<void> registerServices() async {
  locator
    ..registerSingleton<Dio>(Dio()
  /*     ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 5)
      ..options.sendTimeout = const Duration(seconds: 5) */
      )
    ..registerLazySingleton<HiveClient>(HiveClient.new)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance)
    ..registerLazySingleton<AuthRepositorymplementation>(
      AuthRepositorymplementation.new,
    )
    ..registerLazySingleton<LocalUSerData>(LocalUSerData.new)
    ..registerSingleton<BackendAuthDataSource>(
      BackendAuthDataSource(locator()),
    )
    ..registerLazySingleton<TourBackendDataSource>(
      () => TourBackendDataSource(locator()),
    )
    ..registerLazySingleton<NetworkConnectivity>(
      NetworkConnectivity.new,
    )
    ..registerSingleton<TripRepository>(
      TripRepositoryImplementation(
        backendDataSource: locator(),
        authData: locator(),
      ),
    )
    ..registerSingleton<GetCurrentLocationUsecase>(
      GetCurrentLocationUsecase(repository: locator()),
    )
    ..registerLazySingleton<CreateTourUsecase>(
      () => CreateTourUsecase(repository: locator()),
    )
    ..registerLazySingleton<CompleteTourUsecase>(
      () => CompleteTourUsecase(repository: locator()),
    )
    ..registerLazySingleton<CancelTourUsecase>(
      () => CancelTourUsecase(repository: locator()),
    )
    ..registerLazySingleton<CallDriverUsecase>(
      () => CallDriverUsecase(repository: locator()),
    )
    ..registerLazySingleton<GetTripsUsecase>(
      () => GetTripsUsecase(locator()),
    )
    ..registerFactory<HomeBloc>(
      () => HomeBloc(locator(), locator(), locator(), locator(), locator()),
    )
    ..registerFactory<AuthBloc>(() => AuthBloc(locator()))
    ..registerLazySingleton<BookingCubit>(() => BookingCubit(locator()))
    ..registerLazySingleton<StreamChatClient>(
      () => StreamChatClient(
        'vq59whjehqv3',
        logLevel: Level.INFO,
      ),
    )
    ..registerLazySingleton<ImagePicker>(ImagePicker.new);
}
