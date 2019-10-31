class FoodMenu {
  String greetings;
  List<Category> cat;
  List<Category> today;
  List<Category> promo;


  FoodMenu({
    this.greetings, this.cat ,this.today, this.promo});

  factory FoodMenu.fromJson(Map<String, dynamic> json){
    return FoodMenu(
      greetings: json['greetings'],
      cat: (json['categories'] as List).map((i) => Category.fromJson(i)).toList(),
      today : (json['todays_picks'] as List).map((i) => Category.fromJson(i)).toList(),
      promo : (json['promo_events'] as List).map((i) => Category.fromJson(i)).toList(),
    );
  }

}

class Category{
  int id;
  String title;
  String image;
  int numbers;

  Category({this.id, this.title, this.image, this.numbers});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json['id'],
      title: (json.containsKey('title'))?json['title']:null,
      image: json['image'],
      numbers: (json.containsKey('numbers'))?json['numbers']:null,
    );
  }
}