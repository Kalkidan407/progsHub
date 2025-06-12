// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'product.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Fake Store', home: ProductListScreen());
//   }
// }

// class ProductListScreen extends StatefulWidget {
//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   late Future<List<Product>> _futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     _futureProducts = fetchProducts();
//   }

//   Future<List<Product>> fetchProducts() async {
//     final response = await http.get(
//       Uri.parse('https://fakestoreapi.com/products'),
//     );

//     if (response.statusCode == 200) {
//       List jsonData = json.decode(response.body);
//       return jsonData.map((item) => Product.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Fake Store Products')),
//       body: FutureBuilder<List<Product>>(
//         future: _futureProducts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting)
//             return Center(child: CircularProgressIndicator());
//           else if (snapshot.hasError)
//             return Center(child: Text('Error: ${snapshot.error}'));

//           final products = snapshot.data!;
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return Card(
//                 child: ListTile(
//                   leading: Image.network(product.image, height: 50, width: 50),
//                   title: Text(product.title),
//                   subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
