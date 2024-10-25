import 'package:library_app/data/datasource/books_datasource.dart';
import 'package:library_app/data/entitis/book.dart';
import 'package:library_app/data/repositories/books_repository.dart';

class BookRepositoryIml extends BooksRepository {
  final BooksDatasource datasource;

  BookRepositoryIml(this.datasource);
  @override
  Future<List<Book>> getBooksByQuery(String quey) async =>
      datasource.getBooksByQuery(quey);
}
