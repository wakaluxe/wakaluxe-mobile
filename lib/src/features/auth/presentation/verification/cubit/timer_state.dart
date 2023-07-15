import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int? elapsed;
  const TimerState(this.elapsed);
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimerInProgress extends TimerState {
  const TimerInProgress(int? elapsed) : super(elapsed);

  @override
  // TODO: implement props
  List<Object?> get props => [elapsed];
}
