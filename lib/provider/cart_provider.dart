import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/models/cart_item.dart';
import 'package:flutter_shop/products/models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];
  double _totalPrice = 0.0;

  List<CartItem> get items => _cartItems;

  void addItem(Product product) {
    _cartItems.add(CartItem(1, product));
    updateTotalPrice();
    notifyListeners();
  }

  double get totalAmount {
    return _totalPrice;
  }

  void updateTotalPrice() {
    _totalPrice =
        _cartItems.fold(0.00, (double total, item) => total + item.totalPrice);
    notifyListeners();
  }

  bool inCart(Product product) {
    return _cartItems.any((item) => item.product.id == product.id);
  }

  void deleteItem(CartItem cartItem) {
    _cartItems.remove(cartItem);
    updateTotalPrice();
    notifyListeners();
  }

  void clear() {
    _cartItems.clear();
    updateTotalPrice();
    notifyListeners();
  }
}
