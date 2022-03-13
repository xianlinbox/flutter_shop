import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_empty.dart';
import 'package:flutter_shop/cart/cart_item.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/products/models/product.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = [];

    return products.isEmpty
        ? const Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(title: Text("Cart(${products.length})"), actions: [
              IconButton(
                icon: Icon(AppIcons.delete),
                onPressed: () {},
              ),
            ]),
            body: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return const CartItem();
                },
                itemCount: 6,
              ),
            ),
            bottomSheet: _checkoutSection(context),
          );
  }

  Widget _checkoutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: const Border(top: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [AppColors.gradiendLStart, AppColors.gradiendLEnd],
                    stops: const [0.0, 1.0])),
            child: Material(
              color: Colors.transparent,
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
          ),
          Row(
            children: [
              Text("Total: ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(context).textSelectionTheme.selectionColor)),
              Text(
                "\$0.00",
                style: TextStyle(fontSize: 18, color: AppColors.purple800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
