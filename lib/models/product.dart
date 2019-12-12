import 'dart:convert';

String allPostsToJson(List<Product> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

List<Product> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Product>.from(jsonData.map((x) => Product.fromJson(x)));
}

class Product {
  int id;
  String title;
  String description;
  int price;
  String category;
  String image = '';
  bool isBestSeller;
  int quantity =0;
  
  Product(
    this.id,
    this.title,
    this.description,
    this.price,
    this.category,
    this.isBestSeller,
    this.image,
  );
  List<Product> getProducts(String str) {
    final jsonData = json.decode(str);
    return new List<Product>.from(jsonData.map((x) => Product.fromJson(x)));
  }
  
  factory Product.fromJson(Map<String, dynamic> json) => new Product(
        json["id"],
        json["title"],
        json["description"],
        json["price"],
        json["category"],
        json["isBestSeller"],
        json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "title": title,
        "description": description,
        "price": title,
        "category": category,
        "isBestSeller": isBestSeller,
        "image": image,
      };
}
