import 'package:countries_app/feature/country/country_service.dart';
import 'package:countries_app/feature/home/home_screen_service.dart';
import 'package:countries_app/services/network_service.dart';
import 'package:countries_app/services/toast_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<HomeScreenService>(() => HomeScreenService());
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());
  getIt.registerLazySingleton<ToastService>(() => ToastService());
    getIt.registerLazySingleton<CountryService>(() => CountryService());

}
