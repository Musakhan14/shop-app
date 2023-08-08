import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourit;
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      this.isFavourit = false,
      required this.description});

  void toggleFavouriteStatus() {
    isFavourit = !isFavourit;
    notifyListeners();
  }
}
