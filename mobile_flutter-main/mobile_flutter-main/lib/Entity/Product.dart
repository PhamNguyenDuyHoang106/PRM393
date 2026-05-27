import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String id;
  final String? image;
  double price;
  Product({
    required this.name,
    required this.id,
    this.image,
    required this.price,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      id: json['id'],
      image: json['image'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id, 'image': image, 'price': price};
  }

  @override
  String toString() {
    return 'Product{name: $name, id: $id, image: $image, price: $price}';
  }

  Product copyWith({String? name, String? id, String? image, double? price}) {
    return Product(
      name: name ?? this.name,
      id: id ?? this.id,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  static List<Product> products = [
    Product(id: "P01", name: "Iphone 14", price: 20000),
    Product(id: "P02", name: "Iphone 15", price: 30000),
    Product(id: "P03", name: "Iphone 16", price: 40000),
    Product(id: "P04", name: "Iphone 17", price: 50000),
    Product(id: "P05", name: "Iphone 18", price: 60000),
    Product(id: "P06", name: "Iphone 19", price: 70000),
  ];
}
