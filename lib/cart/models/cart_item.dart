import 'package:flutter/material.dart';
import '../../products/models/product.dart';

class CartItem extends ChangeNotifier {
  int quanity = 0;
  Product product;

  CartItem(this.quanity, this.product);

  get totalPrice => product.price * quanity;

  void minus(int i) {
    quanity -= i;
    notifyListeners();
  }

  void add(int i) {
    quanity += i;
    notifyListeners();
  }
}
