import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/foodModel.dart';
import 'package:senja/controllers/foodContoller.dart';


class FoodCardPicks extends StatefulWidget{
  @override
  _FoodCardPicksState createState() => _FoodCardPicksState();

}

class _FoodCardPicksState extends State<FoodCardPicks>{
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
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              "Kategori",
              style: h3,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                (foodMenu == null || isLoading)?Container(
              child: CircularProgressIndicator(),
            ):foodCardPicksContainer(),
              ],
            ),
          )
        ],
      )
    );
  }

  renderFoodPicksCard(Category foodCategory) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.all(0),
      child: Card(
        child: Container(
          height: 200,
          width: 150,
          child: Column(
            children: <Widget>[
              Image.network(
                foodCategory.image,
                height: 150,
              ),
              Container(
                child: Column(
                  children: <Widget>[Text(foodCategory.title)],
                ),
              ), //Nama makanan
              Container(
                child: Text(foodCategory.numbers.toString())  ,
              ) //Harga
            ],
          ),
        ),
      ),
    );
  }

  foodCardPicksContainer() {
    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: foodMenu.today.length,
          itemBuilder: (context, i) {
            return renderFoodPicksCard(foodMenu.cat[i]);
          }),
    );
  }

}