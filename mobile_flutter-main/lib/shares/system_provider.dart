import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Entity/Product.dart';

final selectedProduct = StateProvider<Product>((ref) => Product());

class CartNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void add(Product product) {
    state = [...state, product];
  }

  void remove(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void clear() {
    state = [];
  }

  bool contains(Product product) {
    return state.any((p) => p.id == product.id);
  }
}

final myCartProvider = NotifierProvider<CartNotifier, List<Product>>(
  CartNotifier.new,
);
