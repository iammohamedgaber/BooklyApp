import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/coustom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CoustomBookImageItem(
            imageUrl: item.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          item.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            item.volumeInfo.authors?.join(',') ?? '',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(count: item.volumeInfo.pageCount ?? 0),
        const SizedBox(height: 37),
         BooksAction(item: item,),
      ],
    );
  }
}
