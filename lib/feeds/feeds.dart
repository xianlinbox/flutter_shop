import 'package:flutter/material.dart';
import 'package:flutter_shop/products/product_item.dart';
import 'package:flutter_shop/provider/products_provider.dart';
import 'package:flutter_shop/products/models/product.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/feeds';
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final List<Product> _products = productsProvider.products;

    return Scaffold(
      appBar: AppBar(title: const Text('Feeds')),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 250 / 460,
          children: List.generate(
              _products.length,
              (index) => ProductItem(
                    product: _products[index],
                  )),
        ),
      ),
    );
  }
}
