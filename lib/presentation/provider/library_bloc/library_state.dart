part of 'library_bloc.dart';

@immutable
sealed class LibraryState {
  final List<Book> history;
  final List<Book> search;
  final bool isLoading;

  const LibraryState(
      {required this.history, required this.search, required this.isLoading});
  LibraryState copyWith({
    final List<Book>? history,
    final List<Book>? search,
    final bool? isLoading,}
  );
}

final class LibraryInitial extends LibraryState {
  LibraryInitial() : super(history: [], isLoading: false, search: []);

  @override
  LibraryState copyWith({
          List<Book>? history, List<Book>? search, bool? isLoading}) =>
      LibrarySetState(
          history: history ?? this.history,
          search: search ?? this.search,
          isLoading: isLoading ?? this.isLoading);
}

class LibrarySetState extends LibraryState {
  const LibrarySetState(
      {required super.history,
      required super.search,
      required super.isLoading});

  @override
  LibraryState copyWith({
          List<Book>? history, List<Book>? search, bool? isLoading}) =>
      LibrarySetState(
          history: history ?? this.history,
          search: search ?? this.search,
          isLoading: isLoading ?? this.isLoading);
}
