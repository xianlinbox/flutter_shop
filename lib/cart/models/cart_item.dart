import '../../products/models/product.dart';

class CartItem {
  int amount;
  Product product;

  CartItem(this.amount, this.product);
}
