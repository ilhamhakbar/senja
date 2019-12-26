import 'dart:convert';

String allPostsToJson(List<Category> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

List<Category> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Category>.from(jsonData.map((x) => Category.fromJson(x)));
}

class Category {
  int id;
  String name;
  String image = '';
  
  Category(
    this.id,
    this.name,
    this.image,
  );
  List<Category> getCategorys(String str) {
    final jsonData = json.decode(str);
    return new List<Category>.from(jsonData.map((x) => Category.fromJson(x)));
  }
  
  factory Category.fromJson(Map<String, dynamic> json) => new Category(
        json["id"],
        json["name"],
        json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "name":name,
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
