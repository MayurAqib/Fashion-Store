import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String decs;
  final double price;
  final String imagePath;
  final String descTitle;
  final String benefits;
  final String specsTitle;
  bool isFavourite;
  Product(
      {required this.id,
      required this.name,
      required this.decs,
      required this.price,
      required this.imagePath,
      this.isFavourite = false,
      required this.descTitle,
      required this.benefits,
      required this.specsTitle});

  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
