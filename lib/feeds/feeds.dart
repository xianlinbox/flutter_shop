import 'package:flutter/material.dart';
import 'package:flutter_shop/feeds/feed_item.dart';
import 'package:flutter_shop/provider/products_provider.dart';
import 'package:flutter_shop/shared/models/product.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/feeds';
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)?.settings.arguments as String?;
    final productsProvider = Provider.of<ProductsProvider>(context);
    final List<Product> _products =
        productsProvider.findProductsByCategory(categoryName);

    return categoryName == null
        ? Scaffold(
            body: Center(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 250 / 460,
                children: List.generate(
                    _products.length,
                    (index) => FeedItem(
                          product: _products[index],
                        )),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(categoryName),
            ),
            body: Center(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 250 / 460,
                children: List.generate(
                    _products.length,
                    (index) => FeedItem(
                          product: _products[index],
                        )),
              ),
            ),
          );
  }
}
