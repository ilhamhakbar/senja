import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/model.dart';
import 'package:senja/controllers/foodContoller.dart';

class FoodCardPicks extends StatefulWidget {
  @override
  _FoodCardPicksState createState() => _FoodCardPicksState();
}

class _FoodCardPicksState extends State<FoodCardPicks> {
  MainMenu mainMenu;
  bool isLoading = false;

  init() async {
    setState(() {
      isLoading = true;
    });
    MainMenu _mainMenuTemp;
    _mainMenuTemp = await getMainMenu();
    setState(() {
      mainMenu = _mainMenuTemp;
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
              (mainMenu == null || isLoading)
                  ? Container(
                      child: CircularProgressIndicator(),
                    )
                  : foodCardPicksContainer(),
            ],
          ),
        )
      ],
    ));
  }

  renderFoodPicksCard(Category foodCategory) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(foodCategory.image),
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
                Text(foodCategory.title)
                ],
            ),
          ),
        ],
      ),
    );
  }

  foodCardPicksContainer() {
    return Container(
      height: 140,
      padding: EdgeInsets.only(top: 5.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: mainMenu.today.length,
          itemBuilder: (context, i) {
            return renderFoodPicksCard(mainMenu.today[i]);
          }),
    );
  }
}
