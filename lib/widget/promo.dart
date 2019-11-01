import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/foodModel.dart';
import 'package:senja/controllers/foodContoller.dart';


class FoodPromo extends StatefulWidget{
  @override
  _FoodPromoState createState() => _FoodPromoState();

}

class _FoodPromoState extends State<FoodPromo>{
  FoodMenu foodMenu;
  bool isLoading = false;

  init() async {
    setState(() {
      isLoading = true;
    });
    FoodMenu _foodMenuTemp;
    _foodMenuTemp = await getFoodMenu();
    setState(() {
      foodMenu = _foodMenuTemp;
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
                (foodMenu == null || isLoading)?Container(
              child: CircularProgressIndicator(),
            ):foodPromoContainer(),
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
          itemCount: foodMenu.promo.length,
          itemBuilder: (context, i) {
            return renderFoodPromo(foodMenu.promo[i]);
          }),
    );
  }

}