import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
        '1',
        'iPhone XR',
        'Electronics',
        'Apple',
        1099,
        "The best phone ever",
        10,
        "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-blue-select-2021?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1629842712000",
        false),
    Product(
        '2',
        'Huwawei P30 Pro',
        'Electronics',
        'Huwawei',
        1099,
        "The best Android phone ever",
        2,
        "https://m.media-amazon.com/images/I/61XM1qbUPUL._AC_SX679_.jpg",
        false),
    Product(
        '3',
        'BURBERRY: The Kensington Trench Coat',
        'Clothes',
        'BURBERRY',
        1099,
        "BURBERRY: The Kensington Trench Coat",
        10,
        "https://image.harrods.com/15/91/66/13/15916613_31786709_2048.jpg",
        true),
    Product(
        '4',
        'GG Supreme Ophidia Small Shoulder Bag',
        'Clothes',
        'Luxury',
        1790,
        "Beige/ebony GG Supreme canvas, a material with low environmental impact, with brown leather trim",
        10,
        "https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1645744562/499621_K05NN_4076_001_065_0000_Light-Ophidia-small-GG-shoulder-bag.jpg",
        false),
    Product(
        '5',
        'lululemon Align™ High-Rise Crop 23"',
        'Clothes',
        'lululemon',
        1099,
        "Feels Buttery Soft and Weightless, Nulu™ Fabric",
        10,
        "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1637260686-screen-shot-2021-11-18-at-1-37-16-pm-1637260646.png",
        true),
  ];

  List<Product> get products => _products;

  List<Product> findProductsByCategory(String? category) {
    return _products
        .where((product) => category == null || product.category == category)
        .toList();
  }
}
