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
            body: const CartFull(),
            bottomSheet: _checkoutSection(context),
          );
  }

  Widget _checkoutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: const Border(top: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            borderRadius: BorderRadius.circular(30),
            color: Colors.red,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context)
                            .textSelectionTheme
                            .selectionColor)),
              ),
            ),
          ),
          const Text("Total: \$0.00"),
        ],
      ),
    );
  }
}
