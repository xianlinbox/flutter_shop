import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/models/dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  final DarThemePreferences darkThemePreference = DarThemePreferences();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
