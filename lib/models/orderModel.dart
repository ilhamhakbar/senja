class OrderMenu {
  List<MenuType> menuType;


  OrderMenu({
    this.menuType});

  factory OrderMenu.fromJson(Map<String, dynamic> json){
    return OrderMenu(
      menuType : (json['categories'] as List).map((i) => MenuType.fromJson(i)).toList(),
    );
  }

}

class MenuType{
  List<Category> categories;

  MenuType({this.categories});

  factory MenuType.fromJson(Map<String, dynamic> json){
    return MenuType(
      categories: (json['menu'] as List).map((i) => Category.fromJson(i)).toList(),
    );
  }
}

class Category{
  String name;
  String description;
  int price;

  Category({this.name, this.description, this.price});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      name: json['name'],
      description: json['description'],
      price: json['price']
    );
  }
}