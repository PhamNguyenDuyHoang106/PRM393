import 'package:flutter/material.dart';
import 'entities/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // ===== DANH SÁCH BAN ĐẦU =====
    debugPrint("===== DANH SÁCH BAN ĐẦU =====");

    for (var p in Product.products) {
      debugPrint(p.toString());
    }

    // ===== ADD PRODUCT =====
    Product.add(
      Product(
        id: 4,
        name: "Laptop Dell",
        image: "dell.png",
        price: 18000000,
      ),
    );

    debugPrint("\n===== SAU KHI ADD =====");

    for (var p in Product.products) {
      debugPrint(p.toString());
    }

    // ===== EDIT PRODUCT =====
    Product.edit(
      Product(
        id: 2,
        name: "Samsung S24 Ultra",
        image: "s24_ultra.png",
        price: 30000000,
      ),
    );

    debugPrint("\n===== SAU KHI EDIT =====");

    for (var p in Product.products) {
      debugPrint(p.toString());
    }

    // ===== SEARCH =====
    debugPrint("\n===== SEARCH 'iphone' =====");

    var searchResult = Product.search("iphone");

    for (var p in searchResult) {
      debugPrint(p.toString());
    }

    // ===== FIND =====
    debugPrint("\n===== FIND ID = 3 =====");

    var found = Product.find(3);

    if (found != null) {
      debugPrint(found.toString());
    } else {
      debugPrint("Không tìm thấy sản phẩm");
    }

    // ===== INCREASE PRICE =====
    Product.increasePrice();

    debugPrint("\n===== SAU KHI TĂNG GIÁ 10% =====");

    for (var p in Product.products) {
      debugPrint(p.toString());
    }

    // ===== JSON -> PRODUCT =====
    Map<String, dynamic> jsonData = {
      "id": 5,
      "name": "iPad Pro",
      "image": "ipad.png",
      "price": 20000000
    };

    Product productFromJson = Product.fromJson(jsonData);

    debugPrint("\n===== PRODUCT FROM JSON =====");

    debugPrint(productFromJson.toString());

    // ===== UI =====
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lab 1 - Product Management"),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: Product.products.length,
          itemBuilder: (context, index) {

            Product product = Product.products[index];

            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(product.id.toString()),
                ),
                title: Text(product.name),
                subtitle: Text(
                  "Price: ${product.price.toStringAsFixed(0)}",
                ),
                trailing: const Icon(Icons.shopping_cart),
              ),
            );
          },
        ),
      ),
    );
  }
}