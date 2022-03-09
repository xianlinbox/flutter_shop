import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart.dart';
import 'package:flutter_shop/feeds/feeds.dart';
import 'package:flutter_shop/products/product_detail.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/screens/bottom_bar.dart';
import 'package:flutter_shop/shared/models/dark_theme_preference.dart';
import 'package:flutter_shop/shared/models/product.dart';
import 'package:flutter_shop/wishlist/wishlist.dart';
import 'package:provider/provider.dart';
import 'shared/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void initCurrentTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getDarkTheme();
  }

  @override
  void initState() {
    initCurrentTheme();
    super.initState();
  }

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
              routes: {
                '/feeds': (context) => const Feeds(),
                '/cart': (context) => const Cart(),
                '/wishlist': (context) => const Wishlist(),
                ProductDetail.routeName: (context) => const ProductDetail(),
              },
            );
          },
        ));
  }
}
