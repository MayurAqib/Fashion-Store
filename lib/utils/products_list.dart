import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saba_fashion_store/provider/products.dart';
import 'package:saba_fashion_store/utils/products_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.showFavs});
  final bool showFavs;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        showFavs ? productData.favoriteProducts : productData.products;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
            value: products[index], child: const ProductsTile());
      },
    );
  }
}
