import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Entity/Product.dart';
import '../../shares/system_provider.dart';
import '../Pages/ProductDetailPage.dart';

class ProductWidgetStateFull extends ConsumerStatefulWidget {
  final Product product;
  const ProductWidgetStateFull({super.key, required this.product});

  @override
  ConsumerState<ProductWidgetStateFull> createState() =>
      _ProductWidgetStateFullState();
}

class _ProductWidgetStateFullState extends ConsumerState<ProductWidgetStateFull> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(myCartProvider);
    final isInCart = cart.any((p) => p.id == widget.product.id);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth <= 450
              ? constraints.maxWidth
              : constraints.maxWidth / 2,
          height: 550,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    for (int i = 0; i < 10; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          ),
                          child: Text("Button ${i + 1}", style: const TextStyle(fontSize: 11)),
                          onPressed: () {},
                        ),
                      ),
                  ],
                ),
                // Ảnh sản phẩm
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
                            child: Image.asset(widget.product.image!, fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              ref.read(selectedProduct.notifier).state = widget.product;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductDetailPage(),
                                ),
                              );
                            },
                            label: const Text("Add to cart"),
                            icon: const Icon(Icons.shopping_cart),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Tên sản phẩm & Heart Icon
                const SizedBox(height: 15),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Product Name: ${widget.product.name}", style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text("Price: ${widget.product.price}\$", style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [for (int i = 0; i < 5; i++) const Icon(Icons.star, color: Colors.yellow)],
                ),
                const SizedBox(height: 8),
                // Mô tả sản phẩm
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[50],
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Text(
                            "Anh Tiến Đạt (Thành viên đồng sáng lập quán cà phê), cho biết khi nhóm lên ý tưởng kinh doanh cũng là lúc cơ quan chức năng của Hà Nội tăng cường lập lại trật tự vỉa hè. Xác định không được tận dụng vỉa hè cho khách ngồi, cả nhóm quyết định điều chỉnh thiết kế nhằm thích ứng một cách lâu dài. ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Productwidget extends StatelessWidget {
  const Productwidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: Card(
          child: Column(
            children: [
              //Ảnh sản phẩm
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset(
                          "assets/images/dog.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 200,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: const Text("Add to cart"),
                          icon: const Icon(Icons.shopping_cart),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Tên sản phẩm
              const SizedBox(height: 15),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name: Tea Cup"),
                          Text("Price: 300\$"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
                          const Text("41"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              //Mô tả sản phẩm
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: SingleChildScrollView(
                      child: Text(
                        "Anh Tiến Đạt (Thành viên đồng sáng lập quán cà phê), cho biết khi nhóm lên ý tưởng kinh doanh cũng là lúc cơ quan chức năng của Hà Nội tăng cường lập lại trật tự vỉa hè. Xác định không được tận dụng vỉa hè cho khách ngồi, cả nhóm quyết định điều chỉnh thiết kế nhằm thích ứng một cách lâu dài. ",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
