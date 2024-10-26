import 'package:dio/dio.dart';
import 'package:library_app/data/datasource/books_datasource.dart';
import 'package:library_app/data/entitis/book.dart';
import 'package:library_app/infrastrcuture/mappers/book_mapper.dart';
import 'package:library_app/infrastrcuture/models/open_library/libray_reponse.dart';
import 'package:nav_service/nav_service.dart';

class OpenLibraryDatasource extends BooksDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://openlibrary.org',
  ));

  @override
  Future<List<Book>> getBooksByQuery(String quey,
      {int limit = 20, int offset = 0}) async {
    if (quey.isEmpty) return [];
    
    try {
      final respo = await dio.get("/search.json",
          queryParameters: {"q": quey, "limit": limit, "offset": offset});
      if (respo.statusCode != 200) {
        SnackService.showSnackbarError("No se puede obtener datos");
        return [];
      }
      final reponseModel = LibrayReponse.fromJson(respo.data);
      final book = reponseModel.docs
          .map((books) => BookMapper.bookToResponce(books))
          .toList();

      return book;
    } catch (e) {
      SnackService.showSnackbarError("Error en en app");
      return [];
    }
  }
}
//the lord of the rings

