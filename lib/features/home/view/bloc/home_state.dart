part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

@immutable
final class HomeInitial extends HomeState {
  const HomeInitial();
}
