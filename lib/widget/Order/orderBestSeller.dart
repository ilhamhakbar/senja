import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/foodModel.dart';
import 'package:senja/controllers/foodContoller.dart';

class OrderBestSeller extends StatefulWidget {
  @override
  _OrderBestSellerState createState() => _OrderBestSellerState();
}

class _OrderBestSellerState extends State<OrderBestSeller> {
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
    return Container(
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
                (foodMenu == null || isLoading)
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
                (foodMenu == null || isLoading)
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

  renderFoodCategoryCard(Category foodCategory) {
    return FlatButton(
        onPressed: () {},
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(foodCategory.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 75,
              width: 75,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      // height: 100,
                      // width: 100,
                      // padding: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.topLeft,
                      child: Text(foodCategory.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Espresso + Milk + Water + Ice",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10.0),
                      // height: 100,
                      // width: 100,
                      // padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      // alignment: Alignment.bottomCenter,
                      child: Text(
                        foodCategory.numbers.toString(),
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
      width: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[ FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.indigo,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ]),
                        ),
                        SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: FloatingActionButton(
                            backgroundColor: Color(0xff02c39a),
                            onPressed: () {},
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ],
        ));
  }

  foodCardCategoryContainer() {
    return Container(
      // height: 100,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10.0))
      // ),
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foodMenu.cat.length,
          itemBuilder: (context, i) {
            return renderFoodCategoryCard(foodMenu.cat[i]);
          }),
    );
  }
}
