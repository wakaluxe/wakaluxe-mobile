import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/l10n/l10n.dart';

import 'package:wakaluxe/src/common/widgets/wakaluxe_button.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';

class NavigationInfoWidget extends StatefulWidget {
  const NavigationInfoWidget({
    super.key,
  });

  @override
  State<NavigationInfoWidget> createState() => _NavigationInfoWidgetState();
}

class _NavigationInfoWidgetState extends State<NavigationInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${state.tourData.durationText}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                Text(
                  '${state.tourData.distanceText}',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                4.vGap,
                WakaluxeButton(
                  action: () =>
                      // Implement your cancel action here
                      _handleComplete(state.tourData.data!.datum!.id!),
                  text: AppLocalizations.of(context).completeTour,
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleComplete(String tourId) {
    context.read<HomeBloc>().add(
          CompleteTripEvent(
            tourId,
          ),
        );
  }
}
