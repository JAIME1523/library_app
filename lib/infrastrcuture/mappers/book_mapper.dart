import 'package:library_app/data/entitis/book.dart';
import 'package:library_app/infrastrcuture/infrastructure.dart';

class BookMapper {
  static const String _imageError =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.UYefmuqvYGCqQqZN9xaW8QHaGp%26pid%3DApi&f=1&ipt=4fbc7ae0065f25063381214ae9f071264ad76d628b25347eada2eff2bd7759df&ipo=images";
  static Book bookToResponce(Doc bookRes) => Book(
    pageMedian: bookRes.numberOfPagesMedian ?? 0,
    publishDate: bookRes.publishDate == null ? "Sin fecha" :bookRes.publishDate!.isNotEmpty ?  bookRes.publishDate![0]: "Sin fecha",
      title: bookRes.title,
      titleSort: bookRes.titleSort,
      titleSuggest: bookRes.titleSuggest,
      autorImage: (bookRes.authorKey != null)
          ? bookRes.authorKey!.isNotEmpty
              ? "https://covers.openlibrary.org/a/olid/${bookRes.authorKey![0]}-M.jpg"
              : _imageError
          : _imageError,
      authorsNames:  bookRes.authorName == null ? []: bookRes.authorName!,
      contributor: bookRes.contributor ?? [],
      authorAlternativeName: bookRes.authorAlternativeName ?? [],
      ratingsAverage: bookRes.ratingsAverage ?? 0.0,
      firstSentence: _getSentece(bookRes.firstSentence),
      imageBook: bookRes.coverI != null
          ? "https://covers.openlibrary.org/b/id/${bookRes.coverI}-M.jpg"
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
