import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/app/app.dart';
import 'package:wakaluxe/app/bloc/app_bloc.dart';
import 'package:wakaluxe/bootstrap.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/Profile/presentation/trip_cubit/cubit/trip_cubit.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/onboarding/language/cubit/language_cubit.dart';
import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppBloc(context.read<AuthRepositorymplementation>()),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => locator(),
        ),
        BlocProvider(create: (context) => TripCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider<AuthBloc>(
          create: (context) => locator(),
        ),
        BlocProvider(create: (context) => PaymentCubit())
      ],
      child: const Wakaluxe(),
    ),
  );
}
