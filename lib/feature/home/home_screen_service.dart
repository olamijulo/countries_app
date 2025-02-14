import 'package:countries_app/app/locator.dart';
import 'package:countries_app/exceptions/countries_exception.dart';
import 'package:countries_app/model/countries_model.dart';
import 'package:countries_app/services/network_service.dart';

class HomeScreenService {
  final NetworkService _networkService = getIt<NetworkService>();

  CountriesModel? _countriesModel;
  CountriesModel? get countriesModel => _countriesModel;


  Future<Map<String, dynamic>> getCountries() async {
    try {
      final response = await _networkService.get('countries');
      _countriesModel = CountriesModel.fromJson(response);
      return response;
    } on CountriesException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
