class Product {
  int id;
  String name;
  String image;
  double price;

  static List<Product> products = [
    Product(
      id: 1,
      name: "iPhone 15",
      image: "iphone15.png",
      price: 25000000,
    ),
    Product(
      id: 2,
      name: "Samsung S24",
      image: "s24.png",
      price: 22000000,
    ),
    Product(
      id: 3,
      name: "Macbook Pro",
      image: "macbook.png",
      price: 35000000,
    ),
  ];

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  static void add(Product product) {
    products.add(product);
  }

  static bool edit(Product updatedProduct) {
    int index = products.indexWhere((p) => p.id == updatedProduct.id);

    if (index != -1) {
      products[index] = updatedProduct;
      return true;
    }

    return false;
  }

  static List<Product> search(String keyword) {
    return products
        .where(
          (p) => p.name.toLowerCase().contains(keyword.toLowerCase()),
    )
        .toList();
  }

  static Product? find(int id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  static void increasePrice() {
    products = products.map((p) {
      return Product(
        id: p.id,
        name: p.name,
        image: p.image,
        price: p.price * 1.1,
      );
    }).toList();
  }

  @override
  String toString() {
    return 'ID: $id - Name: $name - Price: ${price.toStringAsFixed(0)}';
  }
}