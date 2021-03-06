import 'package:scoped_model/scoped_model.dart';
import 'package:senja/models/category.dart';
import 'package:senja/models/product.dart';
import 'package:senja/models/transaksi.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class ProductsModel extends Model {
  List<Category> _categories = [];
  List<Product> _picks = [];
  List<Product> _productsOutlet1 = [];
  List<Product> _productsOutlet2 = [];
  List<Product> _cartList = [];
  List<Product> _cartTemp = [];
  List<Product> _bestSeller = [];
  List<Product> _coffee = [];
  List<String> categoryListOutlet1 = [];
  List<String> categoryListOutlet2 = [];
  // List<Product> _quantity = [];
  List<Item> _items = [];
  List<Map<String, dynamic>> _mapItems = [];
  List<Map<String, dynamic>> get mapItems => _mapItems;

  final baseUrl = 'http://api.flutterapp.in/api/';

  ProductsModel() {
    _productsOutlet1.clear();
    _productsOutlet2.clear();
    _productsOutlet1 = List();
    _productsOutlet2 = List();
    // _products.add(Product(
    //   1,
    //   'Americano Ice',
    //   ' ',
    //   22000,
    //   'Coffee',
    //   false,
    //   'https://i0.wp.com/resepkoki.id/wp-content/uploads/2019/03/kopi.png?fit=883%2C589&ssl=1',
    // ));

    // _products.add(Product(
    //   2,
    //   'Coffee Latte Ice',
    //   'A Classic Combination Of Rich Espresso And Chilled Milk To Balance It Naturally Refreshing',
    //   28000,
    //   'Coffee',
    //   false,
    //   'https://cdn.shopify.com/s/files/1/0060/6230/9494/articles/iced-latte_850x.png?v=1547659326',
    // ));

    // _products.add(Product(
    //   3,
    //   'Cappuccino Ice',
    //   'A Classic Combination Of Rich Espresso And Shaken Milk To Balance It Naturally Refreshing',
    //   28000,
    //   'Coffee',
    //   false,
    //   'https://image.freepik.com/free-photo/favorite-coffee-menu-ice-cappuccino-sweet-beverage-served-with-milk-foam_6351-1491.jpg',
    // ));

    // _products.add(Product(
    //   4,
    //   'Coffee Mocha Ice',
    //   'Combination Of Espresso, Bittersweet Chocolate Sauce And Mil, Served Over Ice',
    //   30000,
    //   'Coffee',
    //   false,
    //   'https://pjscoffeevietnam.com/wp-content/uploads/2018/01/Cold-brew-iced-mocha-1.jpg',
    // ));

    // _products.add(Product(
    //   5,
    //   'Es Kopi Susu',
    //   'Special Coffee Flavored With Sweet Secret Ingridient. Made To Break The Stereotype Of Es Kopi Susu In This Town',
    //   25000,
    //   'Coffee',
    //   true,
    //   'https://duniakulinerku.files.wordpress.com/2018/12/Es-Kopi-Lezat.jpg',
    // ));

    // _products.add(Product(
    //   6,
    //   'Matchapresso',
    //   'A Classic Combination Of Rich Espresso, Matcha And Shaken Milk To Balance It Naturally Refreshing',
    //   30000,
    //   'Food',
    //   true,
    //   'https://jianwenquan.com/wp-content/uploads/2018/09/25443188_1384947164965964_2098746357913615503_n.jpg?x74638',
    // ));

    //  _products.add(Product(
    //   7,
    //   'Bakmi',
    //   'A Classic Combination Of Rich Espresso, Matcha And Shaken Milk To Balance It Naturally Refreshing',
    //   30000,
    //   'Food',
    //   true,
    //   'https://jianwenquan.com/wp-content/uploads/2018/09/25443188_1384947164965964_2098746357913615503_n.jpg?x74638',
    // ));

    //  _products.add(Product(
    //   8,
    //   'Bakso',
    //   'A Classic Combination Of Rich Espresso, Matcha And Shaken Milk To Balance It Naturally Refreshing',
    //   30000,
    //   'Food',
    //   true,
    //   'https://jianwenquan.com/wp-content/uploads/2018/09/25443188_1384947164965964_2098746357913615503_n.jpg?x74638',
    // ));

    //  _products.add(Product(
    //   9,
    //   'Ketoprak',
    //   'A Classic Combination Of Rich Espresso, Matcha And Shaken Milk To Balance It Naturally Refreshing',
    //   30000,
    //   'Others',
    //   true,
    //   'https://jianwenquan.com/wp-content/uploads/2018/09/25443188_1384947164965964_2098746357913615503_n.jpg?x74638',
    // ));
        // splitToCategories();
  }

  void todayspicklist(List<Product> globalPicks){
    // print('mashok');
    _picks.clear();
    for(Product p in globalPicks){
      _picks.add(p);
      // print('nambah');
    }
            // splitToCategories();
  }

void categoryList(List<Category> globalCategories){
  _categories.clear();
  for(Category c in globalCategories){
    _categories.add(c);
  }
}

  void productlist(List<Product> globalPicks){
    _productsOutlet1.clear();
    _productsOutlet1.clear();
    categoryListOutlet1.clear();
    categoryListOutlet2.clear();
    for(Product p in globalPicks){
      _productsOutlet1.add(p);
      _productsOutlet2.add(p);
      categoryListOutlet1.add(p.categoryName);
      categoryListOutlet2.add(p.categoryName);
      // print(p.category);
      //  if(p.category == 3){
      //   categoryNames.add('Espresso Based');
      // } else if(p.category == 4){
      //   categoryNames.add('Single Origin');
      // } else if(p.category == 6){
      //   categoryNames.add('Fritters');
      // } else if(p.category == 7){
      //   categoryNames.add('Sweet Bites');
      // } else if(p.category == 9){
      //   categoryNames.add('Big Bites');
      // } else if(p.category == 8){
      //   categoryNames.add('Light Bites');
      // } else if(p.category == 10){
      //   categoryNames.add('Coffee Based');
      // }else if(p.category == 11){
      //   categoryNames.add('Non Coffee');
      // }
    }
    categoryListOutlet1 = categoryListOutlet1.toSet().toList();
        categoryListOutlet2 = categoryListOutlet2.toSet().toList();

    print(categoryListOutlet1);
        print(categoryListOutlet2);

    // splitToCategories();
    // print(categoryNames);
    // print(products);
            // splitToCategories();
  }

  List<Product> get productsOutlet1 {
    return List.from(_productsOutlet1);
  }

  List<Product> get productsOutlet2{
    return List.from(_productsOutlet2);
  }

  List<Category> get categories{
    return List.from(_categories);
  }
  
   List<Product> get picks {
    return List.from(_picks);
  }

  List<Product> get getCartList {
    return List.from(_cartList);
  }

  List<Product> get getCartTemp {
    {
      return List.from(_cartTemp);
    }
  }

  List<Map<String, dynamic>> get getItemDetails{
    return List.from(_mapItems);
  }

  int get getCartPrice {
    int price = 0;
    getCartList.forEach((Product pro) {
      price += pro.price;
    });
    return price;
  }

  void addToCart(Product product) {
    product.quantity = product.quantity + 1;
    _cartList.add(product);
    _items.add(Item(id: product.id,name: product.title, quantity: product.quantity, price: product.price));
    if (product.quantity == 1){
      _cartTemp.add(product);
    }
    
    notifyListeners();
  }

  void removeFromCart(Product product) {
    product.quantity = product.quantity - 1;
    _cartList.remove(product);
    notifyListeners();
  }
  void emptyCart(Product product){
    _cartList = [];
    _cartTemp = [];
  }

  // void bestSeller(){
  //   for(Product i in _products.where((a) => a.isBestSeller == true).toList()){
  //     _bestSeller.add(i);  
  //   }
  // }
  // void coffee(){
  //   for(Product i in _products.where((a) => a.category == 'Coffee').toList()){
  //     _coffee.add(i);
  //   }
  // }
 

  // void splitToCategories(){
  //   for(Product p in _products){
  //     categoryNames.add(p.category);
  //   }
  //   categoryNames = categoryNames.toSet().toList();
  // }

  void addToMap(){
   for(Item i in _items){
     _mapItems.add(i.toMap());
   }
      print(_mapItems);

   }

   void clearItemMap(){
     _mapItems.clear();
   }
}
