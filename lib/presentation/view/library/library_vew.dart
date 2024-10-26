import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:library_app/config/utils/format_number.dart';
import 'package:library_app/data/data.dart';
import 'package:library_app/presentation/provider/library_bloc/library_bloc.dart';
import 'package:library_app/presentation/view/library/page/book_info_page.dart';
import 'package:library_app/presentation/view/library/widgets/search_book.dart';
import 'package:nav_service/nav_service.dart';

class LibraryVew extends StatelessWidget {
  const LibraryVew({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryBloc>();
    return Scaffold(
      appBar: AppBar(
        
        title: _SearchButton(onTap: (){
            showSearch<Book?>(
                //query: search,
                context: context,
                delegate: SearchBook(
                    searchBookCall: provider.getData,
                    initialData: provider.state.search),
              ).then((book) {
                if (book == null || !context.mounted) return;
                provider.add(UpdateBook(history: book));
                NavService.push(BookInfoView(book: book));
              });
          },),
      ),
      body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          provider.state.history.isEmpty
              ? const Column(
                  children: [
                    Center(
                      child: Text("No se encentraron elementos recientes "),
                    ),
                    Icon(FontAwesomeIcons.faceGrimace)
                  ],
                )
              : Wrap(
                  children: [
                    ...provider.state.history.map((book) => _Slide(book: book))
                  ],
                )
        ],
      ),
    ),
    );
    
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                offset: Offset(2.0, 0)
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color:colors.secondaryContainer,
        ),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Buscar libro",
              style: styleText.bodyLarge,
            ),
            const Icon(FontAwesomeIcons.magnifyingGlass)
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.book,
  });
  final Book book;

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 120,
            child: AspectRatio(
              aspectRatio: 3 / 4.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  fit: BoxFit.cover,
                  width: 120,
                  book.imageBook,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.not_interested_sharp,
                      color: Colors.red,
                      size: 50,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                        onTap: () => NavService.push(BookInfoView(book: book)),
                        child: FadeIn(child: child));
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
//*Title
          SizedBox(
            width: 100,
            child: Text(
              book.title,
              maxLines: 2,
              style: styleText.titleSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(width: 3),
                Text(
                  FormatNumber.number(book.ratingsAverage),
                  style: styleText.bodyMedium!
                      .copyWith(color: Colors.yellow.shade800),
                ),
                const Spacer(),

                // Text("${movie.popularity}", style: styleText.bodySmall,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
