import 'package:countries_app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, bool>(
  (ref) => ThemeProvider(),
);

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false) {
    _loadTheme();
  }

  void toggleTheme() async {
    state = !state;
    Utils.setBoolean('isDarkMode', state);
  }

  Future<void> _loadTheme() async {
    state = await Utils.getBoolean('isDarkMode');
  }
}
