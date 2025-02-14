import 'package:countries_app/app/locator.dart';
import 'package:countries_app/exceptions/countries_exception.dart';
import 'package:countries_app/model/state_model.dart';
import 'package:countries_app/services/network_service.dart';

class CountryService {
    final NetworkService _networkService = getIt<NetworkService>();

  StateModel? _stateModel;
  StateModel? get stateModel => _stateModel;

  Future<Map<String, dynamic>> getStates(String state) async {
    try {
      final response = await _networkService.get('countries/$state/states');
      _stateModel = StateModel.fromJson(response);
      return response;
    } on CountriesException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}