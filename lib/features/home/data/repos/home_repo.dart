import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_moodel/book_moodel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookMoodel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookMoodel>>> fetchFeaturedBooks();
}
