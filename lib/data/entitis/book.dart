class Book {
  final String title;
  final String titleSort;
  final String titleSuggest;
  final String autorImage;
  final String authorName;
  final List<String> contributor;
  final List<String> authorAlternativeName;
  final double ratingsAverage;
  final String firstSentence;
  final String imageBook;

  Book(
      {required this.title,
      required this.titleSort,
      required this.titleSuggest,
      required this.autorImage,
      required this.authorName,
      required this.contributor,
      required this.authorAlternativeName,
      required this.ratingsAverage,
      required this.firstSentence,
      required this.imageBook});
}
