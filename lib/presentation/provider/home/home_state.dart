part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  final int currentPage;
  final ViewEnum currentView;

  const HomeState({required this.currentPage, required this.currentView});
  HomeState copyWith({int? currentPage, ViewEnum? currentView});
}

final class HomeInitial extends HomeState {
  const HomeInitial()
      : super(currentPage: 0, currentView: ViewEnum.libraryView);

  @override
  HomeState copyWith({int? currentPage, ViewEnum? currentView}) => HomeSetState(
      currentPage: currentPage ?? this.currentPage,
      currentView: currentView ?? this.currentView);
}

class HomeSetState extends HomeState {
  const HomeSetState({required super.currentPage, required super.currentView});

  @override
  HomeState copyWith({int? currentPage, ViewEnum? currentView}) => HomeSetState(
      currentPage: currentPage ?? this.currentPage,
      currentView: currentView ?? this.currentView);
}

enum ViewEnum {
  userView,
  libraryView;
}
