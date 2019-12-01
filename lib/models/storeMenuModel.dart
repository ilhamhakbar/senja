class StoreMenuList {
  List<StoreItem> storeItems;


  StoreMenuList({
    this.storeItems});

  factory StoreMenuList.fromJson(Map<String, dynamic> json){
    return StoreMenuList(
      storeItems : (json['food_menu'] as List).map((i) => StoreItem.fromJson(i)).toList(),
    );
  }

}

class StoreItem{
  int id;
  String name;
  String description;
  int price;
  int discount;
  bool bestSeller;
  String category;
  String image;
  int quantity;

  StoreItem({this.id, this.name, this.description, this.price, this.discount, this.bestSeller, this.category, this.image, this.quantity=1});

  factory StoreItem.fromJson(Map<String, dynamic> json){
    return StoreItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      bestSeller: json['best_seller'],
      category: json['category'],
      image: json['image_url'],
    );
  }
  
  void incrementQuantity(){
    this.quantity = this.quantity + 1;
  }
  
  void decrementQuantity(){
    this.quantity = this.quantity - 1;
  }
}