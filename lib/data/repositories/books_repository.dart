import 'package:library_app/data/data.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooksByQuery(String quey, {int limit = 20, int offset = 0});
}