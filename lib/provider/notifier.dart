import 'package:flutter/material.dart';
import '../product_data/product.dart';

class Notifier extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void add(Product product) {
    if (_products.any((p) => p.id == product.id)) {
      _products.removeWhere((p) => p.id == product.id);
    } else {
      _products.add(product);
    }

    notifyListeners();
  }

  void remove(Product product) {
    _products.removeWhere((p) => p.id == product.id);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _products.any((p) => p.id == product.id);
  }
}
