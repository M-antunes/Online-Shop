import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_grid_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
