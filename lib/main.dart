import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_screen.dart';
import 'package:flutter_shop/feeds/feeds.dart';
import 'package:flutter_shop/login/landing_screen.dart';
import 'package:flutter_shop/login/login_screen.dart';
import 'package:flutter_shop/login/signup_screen.dart';
import 'package:flutter_shop/products/brand_products.dart';
import 'package:flutter_shop/products/product_detail.dart';
import 'package:flutter_shop/products/products.dart';
import 'package:flutter_shop/provider/brands_provider.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/provider/products_provider.dart';
import 'package:flutter_shop/screens/app.dart';
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
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
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error occured'),
                ),
              ),
            );
          }
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => themeChangeProvider),
                ChangeNotifierProvider(create: (_) => ProductsProvider()),
                ChangeNotifierProvider(create: (_) => BrandProvider()),
                ChangeNotifierProvider(create: (_) => CartProvider()),
              ],
              child: Consumer<DarkThemeProvider>(
                builder: (context, darkThemeProvider, child) {
                  return MaterialApp(
                    title: 'Flutter Shop',
                    theme: Styles.themeData(
                        themeChangeProvider.darkTheme, context),
                    home: const LandingScreen(),
                    routes: {
                      App.routeName: (context) => const App(),
                      LoginScreen.routeName: (context) => const LoginScreen(),
                      SignupScreen.routeName: (context) => const SignupScreen(),
                      Feeds.routeName: (context) => const Feeds(),
                      CartScreen.routeName: (context) => const CartScreen(),
                      '/wishlist': (context) => const Wishlist(),
                      ProductDetail.routeName: (context) =>
                          const ProductDetail(),
                      Products.routeName: (context) => const Products(),
                      BrandProducts.routeName: (context) =>
                          const BrandProducts(),
                    },
                  );
                },
              ));
        });
  }
}
