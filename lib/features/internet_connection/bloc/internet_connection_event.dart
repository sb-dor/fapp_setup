part of 'internet_connection_bloc.dart';

@immutable
sealed class InternetConnectionEvent {
  const InternetConnectionEvent();
}

@immutable
final class CheckInternetConnection extends InternetConnectionEvent {
  const CheckInternetConnection();
}
