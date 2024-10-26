class Book {
  final String title;
  final String titleSort;
  final String titleSuggest;
  final String autorImage;
  final List<String> authorsNames;
  final List<String> contributor;
  final List<String> authorAlternativeName;
  final double ratingsAverage;
  final String firstSentence;
  final String imageBook;
  final String publishDate;
  final int pageMedian;

  Book({
    required this.title,
    required this.titleSort,
    required this.titleSuggest,
    required this.autorImage,
    required this.authorsNames,
    required this.contributor,
    required this.authorAlternativeName,
    required this.ratingsAverage,
    required this.firstSentence,
    required this.imageBook,
    required this.publishDate,
    required this.pageMedian,
  });
}
