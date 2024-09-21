part of 'internet_connection_bloc.dart';

@immutable
sealed class InternetConnectionState {}

@immutable
final class InitialConnectionState extends InternetConnectionState {}

@immutable
final class NoInternetConnectionState extends InternetConnectionState {}

@immutable
final class HasInternetConnectionState extends InternetConnectionState {}
