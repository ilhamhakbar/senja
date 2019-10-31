import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/foodModel.dart';
import 'package:senja/controllers/foodContoller.dart';

class FoodCardCategory extends StatefulWidget {
  @override
  _FoodCardCategoryState createState() => _FoodCardCategoryState();
}

class _FoodCardCategoryState extends State<FoodCardCategory> {
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
              (foodMenu == null || isLoading)
                  ? Container(
                      child: CircularProgressIndicator(),
                    )
                  : foodCardCategoryContainer(),
            ],
          ),
        )
      ],
    ));
  }

  renderFoodCategoryCard(Category foodCategory) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 100,
        width: 100,
        child: Stack(
          children: <Widget>[
            Image.network(
              foodCategory.image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Container(
              // height: 100,
              // width: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Container(
                // height: 100,
                // width: 100,
                padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 25.0),
                alignment: Alignment.bottomCenter,
                child: Text(foodCategory.title,
                    style: TextStyle(color: Colors.white))),
            Container(
                // height: 100,
                // width: 100,
                padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  foodCategory.numbers.toString(),
                  style: TextStyle(color: Colors.white),
                )), //Nama makanan
          ],
        ),
      ),
    );
  }

  foodCardCategoryContainer() {
    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: foodMenu.cat.length,
          itemBuilder: (context, i) {
            return renderFoodCategoryCard(foodMenu.cat[i]);
          }),
    );
  }
}
