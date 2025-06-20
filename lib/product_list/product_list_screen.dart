import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proghubass/product_data/product.dart';
import 'package:proghubass/provider/notifier.dart';
import 'package:provider/provider.dart';
import 'package:proghubass/favorite_item/favorite.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> _futureProducts;
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          isDarkMode
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(),
          // backgroundColor: const Color.fromARGB(255, 2, 63, 167),
          title: Text('F.S Product'),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.shopping_cart_checkout_outlined),
            ),

            Builder(
              builder:
                  (context) => IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoriteScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite),
                  ),
            ),

            IconButton(
              icon: Icon(
                isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
              ),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 2, 63, 167),
          onPressed: () => {},
          child: Icon(
            Icons.add,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),

        body: FutureBuilder<List<Product>>(
          future: _futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final products = snapshot.data!;

            return GridView.builder(
              padding: const EdgeInsets.all(6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6,
              ),

              itemCount: products.length,

              itemBuilder: (context, index) {
                final product = products[index];

                return Container(
                  padding: EdgeInsets.all(23),

                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(
                      color: const Color.fromARGB(221, 52, 51, 51),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Expanded(
                        child: Image.network(
                          product.image,

                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          IconButton(
                            onPressed:
                                () => {
                                  Provider.of<Notifier>(
                                    context,
                                    listen: false,
                                  ).add(product),
                                },
                            icon: Consumer<Notifier>(
                              builder: (context, Notifier, _) {
                                final isFav = Notifier.isFavorite(product);
                                Notifier.isFavorite(product);
                                return Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFav ? Colors.red : Colors.grey,
                                );
                              },
                            ),
                          ),

                          SizedBox(width: 1),
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: const Color.fromARGB(255, 59, 58, 58),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
