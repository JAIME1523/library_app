part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChangeView extends HomeEvent {
  final int newCuerrent;

  ChangeView({required this.newCuerrent});
}
