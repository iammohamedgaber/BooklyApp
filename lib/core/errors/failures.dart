import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.DioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Unable to send request, please try again!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          'The server took too long to respond, Please try again.',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          'Secure connection failed, Please try again later!',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServier was canceld');

      case DioExceptionType.connectionError:
        return ServerFailure(
          'Unable to connect to the server, Please check your internet connection!',
        );
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try later!');

      case DioExceptionType.transformTimeout:
        return ServerFailure(
          'Unable to process the server response, Please try again!',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try again!');
    }
  }
}
