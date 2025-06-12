import 'package:flutter/material.dart';
import 'package:proghubass/product_list/product_list_screen.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ProgHub ', home: ProductListScreen());
  }
}
