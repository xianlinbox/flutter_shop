import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDark, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isDark ? Colors.black : Colors.grey.shade300,
        primarySwatch: Colors.purple,
        primaryColor: isDark ? Colors.black : Colors.grey.shade300,
        backgroundColor: isDark ? Colors.grey.shade700 : Colors.white,
        indicatorColor: isDark ? Color(0xff0E1D36) : Color(0xffCBDCF8),
        hintColor: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
        hoverColor: isDark ? Color(0xff3A3A3B) : Color(0xff4285F4),
        focusColor: isDark ? Color(0xff0B2512) : Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        cardColor: isDark ? Color(0xFF151515) : Colors.white,
        canvasColor: isDark ? Colors.black : Colors.grey[50],
        brightness: isDark ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDark ? ColorScheme.dark() : ColorScheme.light()),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        ));
  }
}
