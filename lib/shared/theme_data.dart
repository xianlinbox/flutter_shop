import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDark, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isDark ? Colors.black : Colors.grey.shade300,
        primarySwatch: Colors.purple,
        primaryColor: isDark ? Colors.black : Colors.grey.shade300,
        backgroundColor: isDark ? Colors.grey.shade700 : Colors.white,
        indicatorColor:
            isDark ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
        hintColor: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
        hoverColor: isDark ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
        focusColor: isDark ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        cardColor: isDark ? const Color(0xFF151515) : Colors.white,
        canvasColor: isDark ? Colors.black : Colors.grey[50],
        brightness: isDark ? Brightness.dark : Brightness.light,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDark ? Colors.white : Colors.black,
        ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDark ? const ColorScheme.dark() : const ColorScheme.light()),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        ));
  }
}
