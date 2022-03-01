import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_empty.dart';
import 'package:flutter_shop/cart/cart_full.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/models/product.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = [Product()];

    return products.isEmpty
        ? const Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(title: Text("Cart(${products.length})"), actions: [
              IconButton(
                icon: Icon(AppIcons.delete),
                onPressed: () {},
              ),
            ]),
            body: const CartFull());
  }
}
