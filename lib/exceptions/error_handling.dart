import 'package:countries_app/exceptions/countries_exception.dart';
import 'package:dio/dio.dart';

mixin ErrorHandling {
  void handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw CountriesException(
          message:
              "Opps, this is taking too long. Check your network and try again.");
    }

    if (e.type == DioExceptionType.connectionError) {
      throw CountriesException(
          message: "Please check your internet connection and try again.");
    }

    if (e.type == DioExceptionType.unknown) {
      throw CountriesException(
          message: "Something occured at this time. Please try again.");
    }

    if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
      throw CountriesException(message: "Service is unavailable at this time.");
    }

    if (e.response!.statusCode! >= 400) {
      throw CountriesException(message: e.response?.data['message']);
    }
  }
}
