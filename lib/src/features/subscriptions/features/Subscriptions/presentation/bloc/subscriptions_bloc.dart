import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'subscriptions_event.dart';
part 'subscriptions_state.dart';

class SubscriptionsBloc extends Bloc<SubscriptionsEvent, SubscriptionsState> {
  SubscriptionsBloc() : super(SubscriptionsInitial()) {
    on<SubscriptionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
