import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.elapsed);
  final int? elapsed;
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimerInProgress extends TimerState {
  const TimerInProgress(super.elapsed);

  @override
  // TODO: implement props
  List<Object?> get props => [elapsed];
}
