import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<ChangeView>((event, emit) {
      final newView = switch (event.newCuerrent) {
        0 => ViewEnum.libraryView,
        1 => ViewEnum.userView,
        _ => ViewEnum.libraryView
      };

      emit(state.copyWith(currentPage: event.newCuerrent, currentView: newView));
    });
  }
}
