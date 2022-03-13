import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String id;
  final String name;
  final String category;
  final String brand;
  final double price;
  final String description;
  final int quantity;
  final String imageUrl;
  final bool isFavourite;

  Product(this.id, this.name, this.category, this.brand, this.price,
      this.description, this.quantity, this.imageUrl, this.isFavourite);
}
