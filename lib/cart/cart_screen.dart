import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_empty.dart';
import 'package:flutter_shop/cart/cart_item_widget.dart';
import 'package:flutter_shop/cart/models/cart_item.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<CartItem> items = cartProvider.items;

    return items.isEmpty
        ? const Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(title: Text("Cart(${items.length})"), actions: [
              IconButton(
                icon: Icon(AppIcons.delete),
                onPressed: () {},
              ),
            ]),
            body: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    ChangeNotifierProvider.value(
                  value: items[index],
                  child: const CartItemWidget(),
                ),
                itemCount: items.length,
              ),
            ),
            bottomSheet: _checkoutSection(context, cartProvider),
          );
  }

  Widget _checkoutSection(BuildContext context, CartProvider cartProvider) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: const Border(top: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    AppColors.gradiendLStart,
                    AppColors.gradiendLEnd
                  ], stops: const [
                    0.0,
                    1.0
                  ])),
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
                        color: Theme.of(context)
                            .textSelectionTheme
                            .selectionColor)),
                Text(
                  "\$ ${cartProvider.totalAmount}",
                  style: TextStyle(fontSize: 18, color: AppColors.purple800),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
