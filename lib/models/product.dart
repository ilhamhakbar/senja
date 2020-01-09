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
  int base_price;
  int price;
  String categoryName;
  String image = '';
  bool isBestSeller;
  int quantity =0;
  
  Product(
    this.id,
    this.title,
    this.description,
    this.base_price,
    this.price,
    this.categoryName,
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
        json["base_price"],
        json["final_price"],
        (json.containsKey('categories'))?json["categories"]["name"]:'',
        (json["is_bestseller"] == 1),
        json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "product_name": title,
        "product_description": description,
        "base_price": base_price,
        "final_price": price,
        "categoryName": categoryName,
        "is_bestseller": isBestSeller,
        "image": image,
      };
}

// class Category{
//   int idCategory;
//   int categoryName;

//   Category({
//     this.idCategory,
//     this.categoryName,
//   });
//   factory Category.fromJson(Map<String, dynamic> json){
//     return Category(
//         idCategory: json['id'],
//       categoryName: json['name'],
//     );
//   }
// }
