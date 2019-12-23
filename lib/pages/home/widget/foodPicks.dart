import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/theme.dart';
// import 'package:senja/models/model.dart';
// import 'package:senja/controllers/foodContoller.dart';
import 'package:senja/models/product.dart';
import 'package:senja/pages/order/product_details.dart';
import 'package:senja/provider/menu_provider.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/constants/url.dart' as uri;

class FoodCardPicks extends StatefulWidget {
  // final MenuProvider mp;

  
  @override
  _FoodCardPicksState createState() => _FoodCardPicksState();
}

class _FoodCardPicksState extends State<FoodCardPicks> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 20.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "Today's Picks",
            style: h4,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            children: <Widget>[
              // (mainMenu == null || isLoading)
              //     ? Container(
              //         child: CircularProgressIndicator(),
              //       )
              //     : 
                  foodCardPicksContainer(model.picks, model),
            ],
          ),
        )
      ],
    ));
  });}

  renderFoodPicksCard(BuildContext context, Product product, ProductsModel model) {
    // print('title-nya : '+uri.baseurl);
    // print(uri.imageUrl+product.image);
    return FlatButton(
      onPressed: () {ProductDetails();},
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(uri.imageUrl+product.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: 100,
              width: 200),
          Container(
            height: 30,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 1)
                )
              ]
            ),
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Column(
              children: <Widget>[
                Text(product.title)
                ],
            ),
          ),
        ],
      ),
    );
  }


  foodCardPicksContainer(List<Product> products,ProductsModel model ) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(top: 5.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index,) => renderFoodPicksCard(context,  products[index], model),
          // {
          //   return (widget.mp.mainMenu == null)? loadingBox(height: 100, width: 100): renderFoodPicksCard(widget.mp.mainMenu.today[i]);
          // }
          ),
    );
  }
}
