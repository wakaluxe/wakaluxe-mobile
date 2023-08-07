import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/app/app.dart';
import 'package:wakaluxe/bootstrap.dart';
import 'package:wakaluxe/src/features/onboarding/language/cubit/language_cubit.dart';

void main() {
  bootstrap(
    () => BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: const Wakaluxe(),
    ),
  );
}
