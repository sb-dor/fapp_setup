part of 'internet_connection_bloc.dart';

@immutable
sealed class InternetConnectionEvent {}

@immutable
final class CheckInternetConnection extends InternetConnectionEvent {
  final BuildContext context;

  CheckInternetConnection(this.context);
}
