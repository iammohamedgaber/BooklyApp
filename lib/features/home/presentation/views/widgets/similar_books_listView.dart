import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loding_indicator.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cuibt/similar_books_cuibt.dart';
import 'package:bookly/features/home/presentation/views/widgets/coustom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCuibt, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksCuibtSuccess ) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CoustomBookImageItem(
                    imageUrl: 'https://picsum.photos/seed/picsum/200/300',
                  ),
                );
              },
            ),
          );
        }
        else if(  state is  SimilarBooksCuibtFailure){
          return CustomErrorWidget(errorMessage: state.errMessage,);
        }
        else{
          return CustomLodingIndicator();
        }
      },
    );
  }
}
