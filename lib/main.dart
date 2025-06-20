import 'package:flutter/material.dart';
import 'package:proghubass/product_list/product_list_screen.dart';
import 'package:proghubass/provider/notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Notifier(),
      child: const ProductListScreen(),
    ),
  );
}
