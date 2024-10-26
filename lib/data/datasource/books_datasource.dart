import 'package:library_app/data/entitis/book.dart';

abstract class BooksDatasource {
  Future<List<Book>> getBooksByQuery(String quey,{int limit = 20, int offset = 0,});
}


