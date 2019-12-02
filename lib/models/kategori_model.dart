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