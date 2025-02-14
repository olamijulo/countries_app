import 'package:countries_app/exceptions/error_handling.dart';
import 'package:countries_app/interceptors/app_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkService with ErrorHandling {
  late final Dio dio;
  final String url = "https://restfulcountries.com/api/v1/";

  NetworkService() {
    _initializeDio();
  }

  Future<void> _initializeDio() async {

    dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(minutes: 1),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
        AppInterceptor(),
      ]);
    }

    dio.interceptors.add(AppInterceptor());

   
  }


  Future get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,

      );

      return response.data;
    } on DioException catch (e) {
      handleError(e);
    }
  }
}