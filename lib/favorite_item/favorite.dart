import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proghubass/provider/notifier.dart';
import 'package:proghubass/product_data/product.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final favoriteProducts = Provider.of<Notifier>(context).products;
    final favoriteProducts = context.watch<Notifier>().products;
    final favDelete = context.watch<Notifier>();
    // final favoriteProducts = context.watch<Notifier>().products;
    final totalPrice = favoriteProducts.fold(
      0.0,
      (sum, item) => sum + item.price,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Column(
        children: [
          Expanded(
            child:
                favoriteProducts.isEmpty
                    ? const Center(child: Text("No favorite products yet."))
                    : ListView.builder(
                      itemCount: favoriteProducts.length,
                      itemBuilder: (context, index) {
                        Product product = favoriteProducts[index];

                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,

                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 25),
                          ),

                          onDismissed: (direction) {
                            favDelete.remove(product);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${product.title} removed from favorites',
                                ),
                              ),
                            );
                          },

                          child: ListTile(
                            leading: Image.network(product.image, width: 50),
                            title: Text(product.title),
                            subtitle: Text(
                              "\$${product.price.toStringAsFixed(2)}",
                            ),
                          ),
                        );
                      },
                    ),
          ),

          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ", style: TextStyle(fontSize: 18)),
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
