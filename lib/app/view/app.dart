import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/features/onboarding/thememode/cubit/theme_cubit.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.dart';

class Wakaluxe extends StatefulWidget {
  const Wakaluxe({super.key});

  @override
  State<Wakaluxe> createState() => _WakaluxeState();
}

class _WakaluxeState extends State<Wakaluxe> {
  late WakaluxeRouter router;
  @override
  void initState() {
    router = WakaluxeRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const theme = WakaluxeTheme();
    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return ScreenUtilInit(
          designSize: const Size(414, 850),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              themeMode: state == false ? ThemeMode.light : ThemeMode.dark,
              theme: theme.toThemeData(Brightness.light),
              darkTheme: theme.toThemeData(
                Brightness.dark,
              ),
              //routeInformationParser: router.defaultRouteParser(),
              // routerDelegate: router.delegate(),
              debugShowCheckedModeBanner: false,
              routerConfig: router.config(),
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}
