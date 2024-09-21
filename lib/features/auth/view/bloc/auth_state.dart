part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final AuthStateModel authStateModel;

  const AuthState(this.authStateModel);
}

final class AuthInitial extends AuthState {
  const AuthInitial(super.authStateModel);
}
