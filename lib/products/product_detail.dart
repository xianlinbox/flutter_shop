import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/models/product.dart';

class ProductDetail extends StatelessWidget {
  // final Product _product = new Product();

  ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Text('Product Detail'),
      ),
    );
  }
}
