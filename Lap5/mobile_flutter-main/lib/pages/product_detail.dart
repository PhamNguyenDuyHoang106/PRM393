import 'package:flutter/material.dart';
import 'package:exam/entities/ui/Product.dart';

class ProductDetail extends StatelessWidget {
  Product product;

  ProductDetail({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                width: double.infinity,
                fit: BoxFit.cover,
                product.image!,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("${product.price.toString()}\$"),
            Text(product.description!),
          ],
        ),
      ),
    );
  }
}
