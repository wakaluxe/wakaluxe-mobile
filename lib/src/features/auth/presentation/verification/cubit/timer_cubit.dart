import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:wakaluxe/src/features/auth/presentation/verification/cubit/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitial());

  Timer? _timer;
  void onTick(Timer timer) {
    if (state is TimerInProgress) {
      TimerInProgress wip = state as TimerInProgress;
      if (wip.elapsed! < 110) {
        emit(TimerInProgress(wip.elapsed! + 1));
      } else {
        _timer!.cancel();
        // Wakelock.disable();
        emit(const TimerInitial());
      }
    }
  }

  void startTimer([int? index]) {
    // Wakelock.enable();
    if (index != null) {
      emit(const TimerInProgress(0));
    } else {
      emit(const TimerInProgress(0));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }
}
