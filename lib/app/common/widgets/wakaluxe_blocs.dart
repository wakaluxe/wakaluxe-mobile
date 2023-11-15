/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
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
          create: (context) => locator(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: child,
    );
  }
}
 */
