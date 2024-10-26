import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:library_app/config/utils/utils.dart';
import 'package:library_app/data/data.dart';

typedef SearchBookCall = Future<List<Book>> Function(String query);

class SearchBook extends SearchDelegate<Book?> {
  final SearchBookCall searchBookCall;

  StreamController<List<Book>> debaucedBook = StreamController.broadcast();
  StreamController<bool> isLoading = StreamController.broadcast();
  bool cargand = false;
  Timer? _debounceTimer;
  List<Book> initialData;
  SearchBook({required this.searchBookCall, required this.initialData});

  void _onQueryChanged(String query) {
    if (cargand) return;
    isLoading.add(true);
    cargand = true;
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isNotEmpty) {
        final movies = await searchBookCall(query, );
        initialData = movies;
        if (!debaucedBook.isClosed) {
          debaucedBook.add(movies);
        }
      }

      isLoading.add(false);
      cargand = false;
    });
  }

  void clearStream() {
    debaucedBook.close();
  }

  Widget _buildResultAndSuggestions({List<Book>? initialWData}) {
    return StreamBuilder(
      initialData: initialWData,
      stream: debaucedBook.stream,
      builder: (context, snapshot) {
        final booksL = snapshot.data ?? [];
        return ListView.builder(
          itemCount: booksL.length,
          itemBuilder: (context, index) {
            return _BookItem(
              bookS: booksL[index],
              onBookSeletor: () {
                clearStream();
        
                close(context, booksL[index]);
              },
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
          stream: isLoading.stream,
          builder: (context, snapshot) {
            return (snapshot.data == null || snapshot.data == false)
                ? FadeIn(
                    animate: query.isNotEmpty,
                    child: IconButton(
                        onPressed: () => query = '',
                        icon: const Icon(Icons.clear)))
                : SpinPerfect(
                    duration: const Duration(seconds: 3),
                    infinite: true,
                    child: IconButton(
                        onPressed: () => query = '',
                        icon: const Icon(Icons.refresh)));
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStream();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultAndSuggestions(initialWData: initialData);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return _buildResultAndSuggestions(initialWData: initialData);
  }
}


class _BookItem extends StatelessWidget {
  final Book bookS;
  final Function()? onBookSeletor;
  const _BookItem({required this.bookS, this.onBookSeletor});
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onBookSeletor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      bookS.imageBook,
                      loadingBuilder: (context, child, loadingProgress) =>
                          FadeIn(child: child),
                    ))),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookS.title,
                    style: styleText.titleMedium,
                  ),
                  Text(
                    bookS.firstSentence,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        FormatNumber.number(bookS.ratingsAverage, decimals: 2),
                        style: styleText.bodyMedium!
                            .copyWith(color: Colors.yellow.shade900),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
