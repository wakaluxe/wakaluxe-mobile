import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_button.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';

class TaxiFetching extends StatefulWidget {
  const TaxiFetching({super.key});

  @override
  State<TaxiFetching> createState() => _TaxiFetchingState();
}

class _TaxiFetchingState extends State<TaxiFetching> {
  int _counter = 5;
  @override
  initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          context.read<HomeBloc>().add(
                OnTripEvent(),
              );
          timer.cancel();
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(
            'assets/animations/taxi.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          Text(
            'Your ride will be here in $_counter...',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: context.colorScheme.tertiaryContainer,
                child: Icon(
                  WakaluxIcons.message_outlined,
                  color: context.colorScheme.onBackground,
                ),
              ),
              5.hGap,
              GestureDetector(
                onTap: () => context.read<HomeBloc>().add(
                      CallDriverEvent('690596606'),
                    ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: context.colorScheme.primaryContainer,
                  child: Icon(
                    WakaluxIcons.phone,
                    color: context.colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          20.vGap,
          WakaluxeButton(
            text: 'Cancel Ride',
            action: _handleCancel,
          )
        ],
      ),
    );
  }

  void _handleCancel() {
    context.read<HomeBloc>().add(
          ShowBookingDetailsEvent(),
        );
  }
}
