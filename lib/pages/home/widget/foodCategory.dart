import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/constants/url.dart' as uri;
import 'package:senja/controllers/foodContoller.dart';
import 'package:senja/models/category.dart';
import 'package:senja/pages/order/product_details.dart';
import 'package:senja/provider/menu_provider.dart';
import 'package:senja/scoped-model/products_model.dart';

class FoodCardCategory extends StatefulWidget {
  final MenuProvider mp;
  FoodCardCategory({
    this.mp
  });
  
  @override
  _FoodCardCategoryState createState() => _FoodCardCategoryState();
}

class _FoodCardCategoryState extends State<FoodCardCategory> {
  @override
  void initState() {
    super.initState();
    // init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 30.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "Kategori",
            style: h4,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProductDetails())),
          child: Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                // (mainMenu == null || isLoading)
                //     ? Container(
                //         child: CircularProgressIndicator(),
                //       )
                //     : 
                    foodCardCategoryContainer(model.categories, model),
              ],
            ),
          ),
        )
      ],
    ));
  });}

  renderFoodCategoryCard(BuildContext context, Category category, ProductsModel model) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(uri.imageUrl+category.image), fit: BoxFit.cover),
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 100,
        width: 100,
        child: Stack(
          children: <Widget>[
            Container(
              // height: 100,
              // width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black.withOpacity(0.5),
              ),
            ),
              Container(
                  // height: 100,
                  // width: 100,
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 25.0),
                  alignment: Alignment.bottomCenter,
                  child: Text(category.name,
                      style: TextStyle(color: Colors.white))),
              Container(
                  // height: 100,
                  // width: 100,
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '5',
                    style: TextStyle(color: Colors.white),
                  )), //Nama makanan
            ],
          ),
        ),
    );
  }

  foodCardCategoryContainer(List<Category> categories,ProductsModel model ) {
    return Container(
      height: 100,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10.0))
      // ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index,) => renderFoodCategoryCard(context,  categories[index], model)),
    );
  }
}
