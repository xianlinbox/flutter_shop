import 'package:flutter/material.dart';
import 'package:flutter_shop/wishlist/wishlist_empty.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _products = [];

    return _products.isEmpty
        ? const Scaffold(
            body: WishListEmpty(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Wishlist'),
            ),
            body: const Center(
              child: Text('Wishlist'),
            ),
          );
  }
}
