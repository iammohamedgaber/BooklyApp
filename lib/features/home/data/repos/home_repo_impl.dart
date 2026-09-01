import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_moodel/book_moodel.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {

  @override
  Future<Either<Failure, List<BookMoodel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookMoodel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
  
}