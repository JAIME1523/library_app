import 'package:library_app/data/entitis/book.dart';
import 'package:library_app/infrastrcuture/models/open_library/libray_reponse.dart';

class BookMapper {
  static const String _imageError =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.UYefmuqvYGCqQqZN9xaW8QHaGp%26pid%3DApi&f=1&ipt=4fbc7ae0065f25063381214ae9f071264ad76d628b25347eada2eff2bd7759df&ipo=images";
  static Book bookToResponce(Doc bookRes) => Book(
      title: bookRes.title,
      titleSort: bookRes.titleSort,
      titleSuggest: bookRes.titleSuggest,
      autorImage: (bookRes.authorKey != null)
          ? bookRes.authorKey!.isNotEmpty
              ? "https://covers.openlibrary.org/a/olid/${bookRes.authorKey}-M.jpg"
              : _imageError
          : _imageError,
      authorName: bookRes.authorName?.first ?? "Sin-nombre",
      contributor: bookRes.contributor ?? [],
      authorAlternativeName: bookRes.authorAlternativeName ?? [],
      ratingsAverage: bookRes.ratingsAverage ?? 0.0,
      firstSentence: _getSentece(bookRes.firstSentence),
      imageBook: bookRes.coverI != null
          ? "https://covers.openlibrary.org/b/id/${bookRes.coverI}-M.jpg "
          : _imageError);

  static String _getSentece(List<String>? firstSentence) {
    if (firstSentence == null) return "Sin texto";
    if (firstSentence.isEmpty) return "Lista basicia";
    for (var element in firstSentence) {
      if (firstSentence.isNotEmpty) return element;
    }
    return "no se encontro datos";
  }

}
