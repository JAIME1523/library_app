part of 'library_bloc.dart';

@immutable
sealed class LibraryEvent {}

class GetBooks extends LibraryEvent {

}
 class UpdateBook  extends LibraryEvent{
   final Book history;

  UpdateBook({required this.history});
 }

 class UpdateBookHistory  extends LibraryEvent{
   final List<Book> historyList;

  UpdateBookHistory({required this.historyList});
 }