import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get items => _cartItems;
}
