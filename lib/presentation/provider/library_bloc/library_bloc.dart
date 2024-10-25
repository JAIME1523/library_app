import 'package:bloc/bloc.dart';
import 'package:library_app/data/entitis/book.dart';
import 'package:meta/meta.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(LibraryInitial()) {
    on<LibraryEvent>((event, emit) {
    });
  }
}