import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/firebase_auth_remote_data_source.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';
import 'dart:convert';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
    late final StreamSubscription<UserEntity> _userSubscription;

  AppBloc(FirebaseAuthRepository repo) : _repo = repo, super(repo.currentUser.hasToken ? AppState.authenticated(repo.currentUser) : const AppState.unauthenticated()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
        on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _repo.user.listen(
      (user) => add(AppUserChanged(user)),
    );
    });
  }
  final FirebaseAuthRepository _repo;

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
