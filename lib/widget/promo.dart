import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/model.dart';
import 'package:senja/controllers/foodContoller.dart';
import 'package:senja/provider/menu_provider.dart';


class FoodPromo extends StatefulWidget{
  final MenuProvider mp;
  FoodPromo({this.mp});
  @override
  _FoodPromoState createState() => _FoodPromoState();

}

class _FoodPromoState extends State<FoodPromo>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
           margin: EdgeInsets.only(left: 20.0,top: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Promo & Event",
              style: h4,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              children: <Widget>[
            //     (mainMenu == null || isLoading)?Container(
            //   child: CircularProgressIndicator(),
            // ):
            foodPromoContainer(),
              ],
            ),
          )
        ],
      )
    );
  }

  renderFoodPromo(Category foodCategory) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.only(right: 10.0),      
        child: Container(
          decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(foodCategory.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)
                      )),
              height: 120,
              width: 200)
    );
  }

  foodPromoContainer() {
    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 5.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: (widget.mp.mainMenu == null)? 2:widget.mp.mainMenu.promo.length,
          itemBuilder: (context, i) {
            return (widget.mp.mainMenu == null)? loadingBox(height: 100, width: 100):renderFoodPromo(widget.mp.mainMenu.promo[i]);
          }),
    );
  }

}