import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
   final _apiKey = 'AIzaSyCFwMzs9ORxSbQYe3V99f_iOFCq4IVZ4MI';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoints,
  }) async {
    var response = await _dio.get(
      "$_baseUrl$endPoints&key=$_apiKey",
    );

    return response.data;
  }
}
