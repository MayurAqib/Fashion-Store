import 'package:flutter/material.dart';

class CartProduct {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
  const CartProduct(
      {required this.id,
      required this.imageUrl,
      required this.price,
      required this.quantity,
      required this.title});
}

class Cart with ChangeNotifier {
  final Map<String, dynamic> _products = {};
  Map<String, CartProduct> get products {
    return {..._products};
  }

  int get itemCount {
    return _products.length;
  }

  //! function to add total price

  double get totalAmount {
    double total = 0.0;
    _products.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  //! function to add product to cart
  void addProduct(
      String productId, double price, String title, String imageUrl) {
    if (_products.containsKey(productId)) {
      //todo:  Change Quantity
      _products.update(
          productId,
          (existingCartProduct) => CartProduct(
              id: existingCartProduct.id,
              imageUrl: existingCartProduct.imageUrl,
              price: existingCartProduct.price,
              quantity: existingCartProduct.quantity + 1,
              title: existingCartProduct.title));
    } else {
      _products.putIfAbsent(
          productId,
          () => CartProduct(
              id: DateTime.now().toString(),
              imageUrl: imageUrl,
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }

  //! function to undo the item added to cart

  void removeSingleItems(String productId) {
    if (!_products.containsKey(productId)) {
      return;
    }
    if (_products[productId]!.quantity > 1) {
      _products.update(
          productId,
          (existingCartItem) => CartProduct(
              id: existingCartItem.id,
              imageUrl: existingCartItem.imageUrl,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1,
              title: existingCartItem.title));
    } else {
      _products.remove(productId);
    }
    notifyListeners();
  }

  //! function to delete the items from cart page
  void removeItemfromCart(String productId) {
    _products.remove(productId);
    notifyListeners();
  }
}
