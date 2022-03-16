import 'package:flutter_shop/products/models/product.dart';

class ProductFilter {
  String key;
  String value;

  ProductFilter({
    required this.key,
    required this.value,
  });

  isFiltered(Product product) {
    switch (key) {
      case 'brand':
        return product.brand.toLowerCase() == value.toLowerCase();
      case 'category':
        return product.category.toLowerCase() == value.toLowerCase();
      case 'all':
        return true;
      default:
        return false;
    }
  }
}
