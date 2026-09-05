import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_cuibt_state.dart';

class SimilarBooksCuibt extends Cubit<SimilarBooksState> {
  SimilarBooksCuibt(this.homeRepo) : super(SimilarBooksCuibtInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksCuibtLoading());
    var result = await homeRepo.fetchSimilardBooks(category: category);
    result.fold(
      (failure) {
        emit(SimilarBooksCuibtFailure(failure.errMessage));
      },
      (books) {
        emit(SimilarBooksCuibtSuccess(books));
      },
    );
  }
}
