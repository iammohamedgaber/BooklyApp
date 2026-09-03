import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loding_indicator.dart';
import 'package:bookly/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSallerListView extends StatelessWidget {
  const BestSallerListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(item: state.books[index],),
              );
            },
          );
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const SliverToBoxAdapter(child: CustomLodingIndicator());
        }
      },
    );
  }
}
