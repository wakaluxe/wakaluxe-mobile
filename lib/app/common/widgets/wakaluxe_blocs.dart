import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/app/bloc/app_bloc.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/Profile/presentation/trip_cubit/cubit/trip_cubit.dart';
import 'package:wakaluxe/src/features/auth/data/firebase_auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/onboarding/language/cubit/language_cubit.dart';
import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';

class WakaluxeBlocs extends StatelessWidget {
  const WakaluxeBlocs({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
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
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(
          create: (context) => AuthBloc(locator<FirebaseAuthRepository>()),
        ),
        BlocProvider(create: (context) => PaymentCubit())
      ],
      child: child,
    );
  }
}
