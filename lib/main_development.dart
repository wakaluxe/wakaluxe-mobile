import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/app/app.dart';
import 'package:wakaluxe/app/bloc/app_bloc.dart';
import 'package:wakaluxe/bootstrap.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/Profile/presentation/trip_cubit/cubit/trip_cubit.dart';
import 'package:wakaluxe/src/features/auth/data/firebase_auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/local_auser_data.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(context.read<FirebaseAuthRepository>()),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(create: (context) => TripCubit()),
        BlocProvider(
            create: (context) => AuthBloc(locator<FirebaseAuthRepository>())),
      ],
      child: const Wakaluxe(),
    ),
  );
}
