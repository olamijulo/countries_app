import 'package:countries_app/app/locator.dart';
import 'package:countries_app/exceptions/countries_exception.dart';
import 'package:countries_app/feature/country/country_service.dart';
import 'package:countries_app/model/state_model.dart';
import 'package:countries_app/services/toast_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryViewModelProvider =
    ChangeNotifierProvider<CountryViewModel>((ref) => CountryViewModel());

class CountryViewModel extends ChangeNotifier {
  final CountryService _countryService = getIt<CountryService>();
  final ToastService _toastService = getIt<ToastService>();


  StateModel? get stateModel => _countryService.stateModel;


  Future<void> getStates(context, {String? state}) async {
    try {
      await _countryService.getStates(state ?? '');

      notifyListeners();
    } on CountriesException catch (e) {
      _toastService.showToast(context,
          title: 'Error', subTitle: e.message ?? '');
    } catch (e, stackTrace) {
      debugPrint('Error fetching states: $e\n$stackTrace');
    }
  }
}
