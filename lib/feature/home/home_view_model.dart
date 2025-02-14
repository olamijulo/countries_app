import 'package:countries_app/app/locator.dart';
import 'package:countries_app/app/theme/app_theme.dart';
import 'package:countries_app/app/theme/theme_provider.dart';
import 'package:countries_app/exceptions/countries_exception.dart';
import 'package:countries_app/feature/home/home_screen_service.dart';
import 'package:countries_app/model/countries_model.dart';
import 'package:countries_app/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider =
    ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  final HomeScreenService _homeScreenService = getIt<HomeScreenService>();
  final ToastService _toastService = getIt<ToastService>();

  CountriesModel? get countriesModel => _homeScreenService.countriesModel;
  List<Datum>? searchData;
  bool isLoading = false;

  Future<void> getCountries(context) async {
    try {
      isLoading = true;
      notifyListeners();
      await _homeScreenService.getCountries();
      searchData = countriesModel?.data ?? [];

      isLoading = false;
      notifyListeners();
    } on CountriesException catch (e) {
      isLoading = false;
      notifyListeners();
      _toastService.showToast(context,
          title: 'Error', subTitle: e.message ?? '');
    } catch (e, stackTrace) {
      isLoading = false;
      notifyListeners();
      debugPrint('Error fetching countries: $e\n$stackTrace');
    }
  }

  void searchByCountryName(String query) {
    if (countriesModel?.data == null || query.isEmpty) {
      searchData = countriesModel?.data;
    }

    searchData = countriesModel?.data
            ?.where((country) =>
                country.name?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList() ??
        [];

    notifyListeners();
  }
}
