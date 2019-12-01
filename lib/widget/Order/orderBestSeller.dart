import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/storeMenuModel.dart';
import 'package:senja/controllers/storeMenuController.dart';
import 'package:senja/widget/Order/foodMenu.dart';

typedef AddShoppingBag();
typedef MinShoppingBag();
class OrderBestSeller extends StatefulWidget {

  final AddShoppingBag addShoppingBag;
  final MinShoppingBag minShoppingBag;
  OrderBestSeller({@required this.addShoppingBag, @required this.minShoppingBag});
  @override
  _OrderBestSellerState createState() => _OrderBestSellerState();
}

class _OrderBestSellerState extends State<OrderBestSeller> {
  int _counter = 0;
  int jumlahDiCart = 0;

  void tambahCart(){
    setState(() {
     jumlahDiCart++; 
    });
    print(jumlahDiCart);
  }
  void kurangCart(){
    setState(() {
     jumlahDiCart--; 
    });
    print(jumlahDiCart);
  }

  void _incrementCounterPlus() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterMinus() {
    setState(() {
      _counter--;
    });
  }

  StoreMenuList storeMenu;
  bool isLoading = false;

  init() async {
    setState(() {
      isLoading = true;
    });
    StoreMenuList _storeMenuTemp;
    _storeMenuTemp = await getStoreMenu();
    setState(() {
      storeMenu = _storeMenuTemp;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 30.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Best Seller",
              style: h3,
            ),
          ),
          Container(
            // padding: EdgeInsets.only(top: 10.0),
            margin: EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                (storeMenu == null || isLoading)
                    ? Container(
                        child: CircularProgressIndicator(),
                      )
                    : foodCardCategoryContainer(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 30.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Coffee",
              style: h3,
            ),
          ),
          Container(
            // padding: EdgeInsets.only(top: 10.0),
            margin: EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                (storeMenu == null || isLoading)
                    ? Container(
                        child: CircularProgressIndicator(),
                      )
                    : foodCardCategoryContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  foodCardCategoryContainer() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,


          physics: const NeverScrollableScrollPhysics(),
          itemCount: storeMenu.storeItems.length,
          itemBuilder: (context, i) {
            // return FoodMenuCard(foodCategory: storeMenu.storemenu[i],removeFromCart:()=> kurangCart(),addToCart:()=> tambahCart(),);
            return FoodMenuCard(foodCategory: storeMenu.storeItems[i],removeFromCart:()=> widget.minShoppingBag(),addToCart:()=> widget.addShoppingBag()());

            // return renderFoodCategoryCard(foodMenu.cat[i]);
          }),
    );
  }
}
