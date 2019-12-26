import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/category.dart';
import 'package:senja/models/product.dart';
import 'package:senja/pages/home/widget/foodCategory.dart';
import 'package:senja/pages/home/widget/foodPicks.dart';
import 'package:senja/pages/home/widget/promo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:senja/provider/menu_provider.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/services/api_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;
  MenuProvider mp;
  List<Product> picks = [];
  List<Category> categories = [];
  List<Product> productsOutlet1 = [];
  bool isLoading = false;

  init() async {
    setState(() {
      isLoading = true;
    });
    productsOutlet1 =  await getProductOutlet1();
    picks = await getTodaysPicks();
    categories = await getCategory();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
         if(picks.isNotEmpty  && productsOutlet1.isNotEmpty){
          //  print('hohoihie');
          model.categoryList(categories);
          model.todayspicklist(picks);
          model.productlist(productsOutlet1);
         } else{
          //  print('hohoho');
         }
      mp = Provider.of<MenuProvider>(context);
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: sizeHorizontal * 100,
                child: Stack(
                  children: <Widget>[
                    Image.asset("assets/images/bgimages.jpeg",
                        height: 250,
                        width: sizeHorizontal * 100,
                        fit: BoxFit.fill),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: sizeHorizontal * 30,
                      left: sizeHorizontal * 30,
                      child: Container(
                        alignment: Alignment.center,
                        //  padding: EdgeInsets.only(left: 25.0, right: 5.0, bottom: 60.0),
                        width: 120,
                        child: Image.asset("assets/images/senja_1.png"),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: Container(
                        width: sizeHorizontal * 70,
                        padding:
                            EdgeInsets.only(left: 25.0, right: 5.0, bottom: 60.0),
                        alignment: Alignment.bottomLeft,
                        child: (isLoading)
                            ? loadingBox(height: 200, width: 100)
                            : Text(
                                "Morning, " + name,
                                style: t2,
                              ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      child: Container(
                        width: sizeHorizontal * 70,
                        padding:
                            EdgeInsets.only(left: 25.0, right: 5.0, bottom: 20.0),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Our stoves are heated up!",
                          style: h2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FoodCardCategory(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FoodCardPicks(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FoodPromo(
                      mp: mp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name");
    setState(() {
      isLoading = false;
    });
  }
}
