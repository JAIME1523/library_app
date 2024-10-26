import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/data.dart';
import 'package:library_app/infrastrcuture/infrastructure.dart';
import 'package:library_app/infrastrcuture/repositories/book_repository_iml.dart';
import 'package:meta/meta.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final datasource = BookRepositoryIml(OpenLibraryDatasource());

  LibraryBloc() : super(LibraryInitial()) {
    on<LibraryEvent>((event, emit) {});
    on<UpdateBook>(_updateBook);
    on<UpdateBookHistory>(_updateBookHistory);
  }
  _updateBookHistory(UpdateBookHistory event, Emitter<LibraryState> emit) {
    emit(state.copyWith(search: event.historyList));
  }

  _updateBook(UpdateBook event, Emitter<LibraryState> emit) async {
    if (state.history.contains(event.history)) return;
    state.history.add(event.history);
    emit(state.copyWith(history: state.history));
  }

  Future<List<Book>> getData(String quey) async {
    final resul = await datasource.getBooksByQuery(quey);
    if (resul.isNotEmpty) {
      add(UpdateBookHistory(historyList: resul));
    }
    return resul;
  }
}
