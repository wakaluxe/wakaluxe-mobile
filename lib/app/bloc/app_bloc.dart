/* import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc(AuthRepositorymplementation repo) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
      on<AppUserChanged>(_onUserChanged);
      on<AppLogoutRequested>(_onLogoutRequested);
      _userSubscription = _repo.user.listen(
        (user) => add(AppUserChanged(user)),
      );
    });
  }
  late final StreamSubscription<UserEntity> _userSubscription;
  final AuthRepositorymplementation _repo;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      !event.user.hasToken
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_repo.signOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  @override
  AppState fromJson(Map<String, dynamic> json) =>
      AppState.fromMap(json['value'] as Map<String, dynamic>);

  @override
  Map<String, AppState> toJson(AppState state) => {'value': state};
}
 */