import 'package:flutter/material.dart';
import 'package:proghubass/product_data/product.dart';

class Notifier extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void add(Product product) {
    if (_products.contains(product)) {
      _products.remove(product);
    } else {
      _products.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _products.contains(product);
  }

  void removeAll() {
    _products.clear();

    notifyListeners();
  }
}
