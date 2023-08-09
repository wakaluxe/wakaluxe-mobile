import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';

class SelectDriverWidget extends StatelessWidget {
  const SelectDriverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: WakaluxeButton(
              text: 'Select a driver',
              action: () {
                context.read<HomeBloc>().add(
                      SelectDriverEvent(
                        selectDriver: !state.selectDriver,
                      ),
                    );
                context.read<HomeBloc>().add(
                      ShowDriversEvent(
                        showDrivers: true,
                        loadingDrivers: false,
                      ),
                    );
              },
              color: context.colorScheme.tertiary,
              textColor: context.colorScheme.onTertiary,
            ),
          );
        },
      ),
    );
  }
}
