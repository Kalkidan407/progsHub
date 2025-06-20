import 'package:flutter/material.dart';
import 'package:proghubass/product_list/product_list_screen.dart';

class ProductList extends StatelessWidget {
  final bool isDarkMode = true;
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          isDarkMode
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
      title: 'ProgHub ',
      home: ProductListScreen(),
    );
  }
}
