import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Entity/Product.dart';
import '../../shares/system_provider.dart';
import '../Widgets/ProductWidget.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Product product = ref.watch(selectedProduct);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            product.name ?? "Product Detail",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ProductWidgetStateFull(product: product),
      ),
    );
  }
}
