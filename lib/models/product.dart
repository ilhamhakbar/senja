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
  int category;
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
        json["product_name"],
        json["product_description"],
        json["final_price"],
        json["categories_id"],
        (json["is_bestseller"] == 1),
        json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "product_name": title,
        "product_description": description,
        "final_price": title,
        "categories_id": category,
        "is_bestseller": isBestSeller,
        "image": image,
      };
}
