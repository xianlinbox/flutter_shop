import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/screens/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'shared/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, darkThemeProvider, child) {
            return MaterialApp(
              title: 'Flutter Shop',
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: const BottomBar(),
            );
          },
        ));
  }
}
