import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cuibt/similar_books_cuibt.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.item});
  final Item item;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCuibt>(
      context,
    ).fetchSimilarBooks(category: widget.item.volumeInfo.categories?.first ?? 'programming');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child: BookDetailsViewBody(item: widget.item),),);
  }
}
