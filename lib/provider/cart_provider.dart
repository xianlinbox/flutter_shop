import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/models/cart_item.dart';
import 'package:flutter_shop/products/models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get items => _cartItems;

  void addItem(Product product) {
    _cartItems.add(CartItem(1, product));
    notifyListeners();
  }
}
