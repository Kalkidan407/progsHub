// @override
// Widget build(BuildContext context) {
//   final favoriteProducts = Provider.of<FavoriteNotifier>(context).favorites;
//   final totalPrice = favoriteProducts.fold(
//     0.0,
//     (sum, item) => sum + item.price,
//   );

//   return Scaffold(
//     appBar: AppBar(title: Text("Favorites")),
//     body: Column(
//       children: [
//         Expanded(
//           child:
//               favoriteProducts.isEmpty
//                   ? Center(child: Text("No favorite products"))
//                   : ListView.builder(
//                     itemCount: favoriteProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = favoriteProducts[index];
//                       return ListTile(
//                         title: Text(product.title),
//                         subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
//                       );
//                     },
//                   ),
//         ),
//         Container(
//           padding: EdgeInsets.all(16),
//           color: Colors.blueGrey,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Total:",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//               Text(
//                 "\$${totalPrice.toStringAsFixed(2)}",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
