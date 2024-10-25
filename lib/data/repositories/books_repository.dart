import 'package:library_app/data/entitis/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooksByQuery(String quey);
}