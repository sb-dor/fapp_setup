import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fapp_setup/features/auth/domain/repo/auth_repo.dart';
import 'package:fapp_setup/features/auth/view/bloc/state_model/auth_state_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final AuthStateModel _currentStateModel;

  final AuthRepo _authRepo;

  AuthBloc(this._authRepo) : super(UnAuthenticatedState(AuthStateModel())) {
    //
    _currentStateModel = state.authStateModel;
    //
    on<AuthEvent>(
      _authEvent,
      transformer: droppable(), // bloc concurrency package
    );
  }

  void _authEvent(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {}
}
