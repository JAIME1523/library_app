import 'package:flutter/material.dart';
import 'package:library_app/data/data.dart';

import '../../../../config/utils/utils.dart';
import '../widgets/widget.dart';

class BookInfoView extends StatelessWidget {
  const BookInfoView({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: Stack(
          children: [
            Container(
              color: colors.onPrimaryFixed,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _TopInfo(book: book),
                    Stack(
                      children: [
                        _MidInfo(
                          book: book,
                        ),
                        InfoDetail(book: book),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class _MidInfo extends StatelessWidget {
  const _MidInfo({
    required this.book,
  });
  final Book book;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final styleText = Theme.of(context).textTheme;
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: colors.secondaryContainer,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 130, top: 10, left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ColumInfo(title: "F. de publicación", info: book.publishDate),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
            _ColumInfo(title: "Paginas", info: book.pageMedian.toString()),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
            Column(
              children: [
                Text(
                  "Puntuación",
                  style: styleText.titleSmall,
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  FormatNumber.number(book.ratingsAverage, decimals: 2),
                  style: styleText.bodyMedium!
                      .copyWith(color: Colors.yellow.shade900),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ColumInfo extends StatelessWidget {
  const _ColumInfo({required this.title, required this.info});
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            maxLines: 2,
            style: styleText.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            info,
            maxLines: 2,
            style: styleText.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _TopInfo extends StatelessWidget {
  const _TopInfo({
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Column(
      children: [
        ImageSelect(image: book.imageBook),
        Text(
          book.title,
          style: styleText.displaySmall!.copyWith(color: Colors.white),
        )
      ],
    );
  }
}
