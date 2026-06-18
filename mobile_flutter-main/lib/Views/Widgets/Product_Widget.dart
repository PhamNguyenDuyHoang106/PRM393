import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Entity/Product.dart';
import '../../shares/system_provider.dart';
import '../Pages/ProductDetailPage.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    var products = Product.products;
    return ReponsiveProudct(products: products);
  }
}

class ReponsiveProudct extends StatelessWidget {
  final List<Product> products;
  const ReponsiveProudct({super.key, required this.products});
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width < 450 ? 1 : 2,
      children: products
          .map((product) => ProductWidget(product: product))
          .toList(),
    );
  }
}

class OneColumnProduct extends StatelessWidget {
  final List<Product> products;
  const OneColumnProduct({super.key, required this.products});
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < 5; i++) ProductWidget(product: products[i]),
      ],
    );
  }
}

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ProductContainer(product: widget.product),
    );
  }
}

class ProductContainer extends ConsumerStatefulWidget {
  final Product product;
  const ProductContainer({super.key, required this.product});

  @override
  ConsumerState<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends ConsumerState<ProductContainer> {
  int _selectSort = 0;
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(myCartProvider);
    final isInCart = cart.any((p) => p.id == widget.product.id);

    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth <= 450
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2,
        height: 500,
        child: Column(
          children: [
            DropdownButton<int>(
              value: _selectSort,
              items: const [
                DropdownMenuItem(value: 0, child: Text("A-Z")),
                DropdownMenuItem(value: 1, child: Text("Z-A")),
                DropdownMenuItem(value: 2, child: Text("Low to High")),
                DropdownMenuItem(value: 3, child: Text("High to Low")),
              ],
              onChanged: (value) => setState(() {
                _selectSort = value!;
              }),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: [
                for (int i = 0; i < 10; i++)
                  ElevatedButton(child: Text("button ${i + 1}"), onPressed: () {}),
              ],
            ),

            // Product Image
            Expanded(
              flex: 7,
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref.read(selectedProduct.notifier).state = widget.product;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailPage(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset(
                          widget.product.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            if (!isInCart) {
                              ref.read(myCartProvider.notifier).add(widget.product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${widget.product.name} added to cart")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${widget.product.name} is already in cart")),
                              );
                            }
                          },
                          label: const Text("Add to cart"),
                          icon: const Icon(Icons.shopping_cart),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Product name, price, like/favorite
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Product Name: ${widget.product.name}"),
                        Text("Price: ${widget.product.price}\$"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {
                        if (isInCart) {
                          ref.read(myCartProvider.notifier).remove(widget.product);
                        } else {
                          ref.read(myCartProvider.notifier).add(widget.product);
                        }
                      },
                      icon: Icon(
                        isInCart ? Icons.favorite : Icons.favorite_border,
                        color: isInCart ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stars
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 5; i++)
                  const Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            // Description
            Expanded(
              flex: 3,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Theo ghi nhận của phóng viên Dân trí, dự án được xây dựng trên một khu đất với nhiều hộ dân sinh sống bên trong, ở giữa khu đất là một khu nghĩa trang với hàng trăm ngôi mộ. Phần lớn diện tích khu vực này hiện vẫn còn bị bao phủ bởi đầm lầy, cỏ cây, bụi rậm, khá hoang sơ.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
