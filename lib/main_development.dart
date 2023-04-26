import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/app/app.dart';
import 'package:wakaluxe/bootstrap.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: const Wakaluxe(),
    ),
  );
}
