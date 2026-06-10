import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:exam/entities/ui/Product.dart';
import 'package:exam/entities/ui/ProductWidget.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final List<Product> products = Product.products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MasonryGridView.count(
          crossAxisCount: constraints.maxWidth < 450 ? 1 : 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductWidget(product: products[index]);
          },
        );
      },
    );
  }
}
