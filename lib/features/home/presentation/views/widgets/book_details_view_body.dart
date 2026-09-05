import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/coustom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:  Padding(
            padding:const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
               const CoustomAppbar(),
                BookDetailsSection(item: item),

              const  Expanded(child: SizedBox(height: 50)),

              const  SimilarBooksSection(),
              const  SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
