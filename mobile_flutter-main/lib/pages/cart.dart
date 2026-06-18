import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Entity/Product.dart';
import '../shares/system_provider.dart';
import '../Views/Pages/ProductDetailPage.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(myCartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          if (cart.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Clear Cart?'),
                    content: const Text('Are you sure you want to remove all items from the cart?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(myCartProvider.notifier).clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Clear', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            )
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'Cart is empty',
                    style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      final Product product = cart[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Ảnh sản phẩm
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: GestureDetector(
                                  onTap: () {
                                    ref.read(selectedProduct.notifier).state = product;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ProductDetailPage(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    product.image!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Tên & Giá sản phẩm
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ref.read(selectedProduct.notifier).state = product;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const ProductDetailPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        product.name ?? '',
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${product.price?.toStringAsFixed(0) ?? '0'}\$',
                                      style: const TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // Nút Delete
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  ref.read(myCartProvider.notifier).remove(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("${product.name} removed from cart")),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Total Summary Panel
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 2),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total:', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text(
                            '${cart.fold<double>(0.0, (sum, item) => sum + (item.price ?? 0.0)).toStringAsFixed(0)}\$',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Checkout functionality is not implemented yet!")),
                          );
                        },
                        child: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
