import 'package:flutter_shop/products/models/product.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cart Provider', () {
    late CartProvider cartProvider;

    setUp(() {
      cartProvider = CartProvider();
      cartProvider.addItem(Product(
          "1", "test", "Sports", "Adidas", 100.0, "test", 2, "test", false));
    });
    test('should get total amount in the cart', () {
      expect(cartProvider.totalAmount, 100.0);
    });

    test('should return true when product is in Cart', () {
      expect(
          cartProvider.inCart(Product(
              "1", "test", "Sports", "Adidas", 100.0, "test", 2, "test", true)),
          true);
    });

    test('should return false when product is not in Cart', () {
      expect(
          cartProvider.inCart(Product("2", "test", "Sports", "Adidas", 100.0,
              "test", 2, "test", false)),
          false);
    });
  });
}
