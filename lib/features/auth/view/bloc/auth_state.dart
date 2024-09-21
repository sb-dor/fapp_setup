part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final AuthStateModel authStateModel;

  const AuthState(this.authStateModel);
}

final class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState(super.authStateModel);
}

final class AuthenticationErrorState extends AuthState {
  const AuthenticationErrorState(super.authStateModel);
}

final class AuthenticatedState extends AuthState {
  const AuthenticatedState(super.authStateModel);
}
