part of 'similar_books_cuibt.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksCuibtInitial extends SimilarBooksState {}

class SimilarBooksCuibtFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksCuibtFailure(this.errMessage);
}

class SimilarBooksCuibtSuccess extends SimilarBooksState {
  final List<Item> books;

  const SimilarBooksCuibtSuccess(this.books);
}

class SimilarBooksCuibtLoading extends SimilarBooksState {}
