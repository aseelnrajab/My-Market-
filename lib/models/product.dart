import 'dart:convert';

class Product {
  String? id;
  String? catId;
  String name;
  String weight;
  String price;
  String imageUrl;
  String description;

  Product({
    this.id,
    required this.catId,
    required this.name,
    required this.description,
    required this.price,
    required this.weight,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'catId': catId,
      'name': name,
      'description': description,
      'price': price,
      'weight': weight,
      'imageUrl': imageUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      catId: map['catId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      weight: map['weight'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
