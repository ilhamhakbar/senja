import 'package:scoped_model/scoped_model.dart';
import 'package:senja/models/product.dart';
import 'package:senja/models/transaksi.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class ProductsModel extends Model {
  List<Product> _picks = [];
  List<Product> _products = [];
  List<Product> _cartList = [];
  List<Product> _cartTemp = [];
  List<Product> _bestSeller = [];
  List<Product> _coffee = [];
  List<int> categoryNames =[];
  // List<Product> _quantity = [];
  List<Item> _items = [];
  List<Map<String, dynamic>> _mapItems = [];
  List<Map<String, dynamic>> get mapItems => _mapItems;

  final baseUrl = 'http://api.flutterapp.in/api/';

  ProductsModel() {
    _products.clear();
    _products = List();
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
        splitToCategories();
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

  void productlist(List<Product> globalPicks){
    _products.clear();
    for(Product p in globalPicks){
      _products.add(p);
      categoryNames.add(p.category);
    }
    // splitToCategories();
    print(categoryNames);
    // print(products);
            // splitToCategories();
  }

  List<Product> get products {
    return List.from(_products);
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
 

  void splitToCategories(){
    for(Product p in _products){
      categoryNames.add(p.category);
    }
    categoryNames = categoryNames.toSet().toList();
  }

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
