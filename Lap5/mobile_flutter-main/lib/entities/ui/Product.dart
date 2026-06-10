class Product {
  final int id;
  String name;
  String? image;
  double price;
  String? description;

  static List<Product> products = [
    Product(
      id: 1,
      name: "Teddy bear",
      image:
          "https://cdn.florista.ph/uploads/product/floristaph/MAR2026/3FtBrownTeddyBear-1773838514957.webp",
      price: 120,
      description:
          "This is a teddy bear. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 2,
      name: "Computer",
      image:
          "https://cdn.florista.ph/uploads/product/floristaph/MAR2026/3FtBrownTeddyBear-1773838514957.webp",
      price: 30,
      description:
          "This is a computer. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 3,
      name: "Barbie Doll",
      image:
          "https://cdn.florista.ph/uploads/product/floristaph/MAR2026/3FtBrownTeddyBear-1773838514957.webp",
      price: 97,
      description:
          "This is a doll. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 4,
      name: "Mobile",
      image:
          "https://cdn.florista.ph/uploads/product/floristaph/MAR2026/3FtBrownTeddyBear-1773838514957.webp",
      price: 89,
      description:
          "This is a mobile. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
  ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
      description: json["description"],
    );
  }

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  void addProduct({
    required int id,
    required String name,
    String? image,
    required double price,
    String? description,
  }) {
    products.add(
      Product(
        id: id,
        name: name,
        image: image,
        price: price,
        description: description,
      ),
    );
  }

  void editProduct({String? name, String? image, double? price}) {
    this.name = name ?? this.name;
    this.image = image ?? this.image;
    this.price = price ?? this.price;
  }

  List<Product> searchByName({required String search}) {
    List<Product> searchList = [];
    searchList = products
        .where((e) => (e.name.toLowerCase()).contains(search.toLowerCase()))
        .toList();
    return searchList;
  }

  Product searchById({required int id}) {
    return products.firstWhere((e) => e.id == id);
  }

  List<Product> searchByPriceRange({double? max, double? min}) {
    List<Product> searchList = [];

    if (max != null && min != null) {
      searchList = products
          .where((e) => e.price >= min && e.price <= max)
          .toList();
    } else if (max != null) {
      searchList = products.where((e) => e.price <= max).toList();
    } else if (min != null) {
      searchList = products.where((e) => e.price >= min).toList();
    }
    return searchList;
  }

  void increasePriceBy10Percent() {
    products = products
        .map(
          (e) => (Product(
            id: e.id,
            name: e.name,
            price: (e.price * 1.1).roundToDouble(),
            image: e.image,
            description: description,
          )),
        )
        .toList();
  }

  List<Product> getListProduct() => products;

  void printProduct() {
    print(
      'product id: ${this.id}, product name: ${this.name}, product price: ${this.price}, product image: ${this.image}',
    );
  }

  void printListProduct() {
    products.forEach(
      (e) => print(
        'product id: ${e.id}, product name: ${e.name}, product price: ${e.price}, product image: ${e.image}',
      ),
    );
  }
}
