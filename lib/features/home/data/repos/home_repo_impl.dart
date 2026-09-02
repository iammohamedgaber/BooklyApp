import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchNewsBook() async {
    try {
      var data = await apiService.get(
        endPoints: 'volumes?Sorting=newest&Filtering=free-ebooks&q=programming',
      );
      final bookModel = BookModel.fromJson(data);

      return Right(bookModel.items ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.DioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=programming',
      );
      final bookModel = BookModel.fromJson(data);

      return Right(bookModel.items ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.DioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
