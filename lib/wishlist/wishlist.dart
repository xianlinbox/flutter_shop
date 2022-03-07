import 'package:flutter/material.dart';
import 'package:flutter_shop/wishlist/wishlist_empty.dart';
import 'package:flutter_shop/wishlist/wishlist_item.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _products = [{}];

    return _products.isEmpty
        ? const Scaffold(
            body: WishListEmpty(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Wishlist(${_products.length})"),
            ),
            body: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const WishlistItem();
                }),
          );
  }
}
