import 'package:flutter/material.dart';
import 'package:library_app/data/data.dart';
import 'package:library_app/presentation/view/library/widgets/chip_wrap.dart';
import 'package:library_app/presentation/view/library/widgets/select_image.dart';

class InfoDetail extends StatelessWidget {
  const InfoDetail({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              ImageSelect(image: book.autorImage),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ColumInfo(
                        title: "Autor : ", info: book.authorsNames.first),
                        const SizedBox(height: 20),
                    _ColumInfo(
                        title: "title Suggest : ", info: book.titleSuggest),
                  ],
                ),
              )
            ],
          ),
          Text(book.firstSentence),
          if (book.authorsNames.isNotEmpty && book.authorsNames.length > 1)
            ChipWrap(dataList: book.authorsNames, title: "Otros  autores"),
          ChipWrap(dataList: book.contributor, title: "Contribuidores"),
          ChipWrap(
              dataList: book.authorAlternativeName,
              title: "Nombre alternitvo del Autor"),
        ],
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
    return Column(
      children: [
        Text(
          title,
          maxLines: 2,
          style: styleText.titleSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          info,
          maxLines: 2,
          style: styleText.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
