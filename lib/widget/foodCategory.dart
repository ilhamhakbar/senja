import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/model.dart';
import 'package:senja/controllers/foodContoller.dart';
import 'package:senja/provider/menu_provider.dart';

class FoodCardCategory extends StatefulWidget {
  final MenuProvider mp;
  FoodCardCategory({
    this.mp
  });
  
  @override
  _FoodCardCategoryState createState() => _FoodCardCategoryState();
}

class _FoodCardCategoryState extends State<FoodCardCategory> {
  // MainMenu mainMenu;
  // bool isLoading = false;

  // init() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   MainMenu _mainMenuTemp;
  //   _mainMenuTemp = await getMainMenu();
  //   setState(() {
  //     mainMenu = _mainMenuTemp;
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        Container(
          margin: EdgeInsets.only(left: 15.0),
          child: Column(
            children: <Widget>[
              // (mainMenu == null || isLoading)
              //     ? Container(
              //         child: CircularProgressIndicator(),
              //       )
              //     : 
                  foodCardCategoryContainer(),
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
          image: DecorationImage(image: NetworkImage(foodCategory.image), fit: BoxFit.cover),
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
      height: 100,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10.0))
      // ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: (widget.mp.mainMenu == null )? 3: widget.mp.mainMenu.cat.length,
          itemBuilder: (context, i) {
            return (widget.mp.mainMenu == null)? loadingBox( height: 100,
        width: 100,): renderFoodCategoryCard(widget.mp.mainMenu.cat[i]);
          }),
    );
  }
}
