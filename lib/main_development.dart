import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/app/app.dart';
import 'package:wakaluxe/bootstrap.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: const Wakaluxe(),
    ),
  );
}
