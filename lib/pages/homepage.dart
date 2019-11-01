import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/widget/foodCategory.dart';
import 'package:senja/widget/foodPicks.dart';
import 'package:senja/widget/promo.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: sizeHorizontal * 100,
              // decoration: BoxDecoration(
              //     color: Colors.blue,
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/bgimages.jpeg'),
              //         fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Image.asset("assets/images/bgimages.jpeg",
                  height: 250,
                  width: sizeHorizontal*100,
                  fit: BoxFit.fill
                  ),
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
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 5.0, bottom: 60.0),
                     alignment: Alignment.bottomLeft,
                    child: Text("Morning, Benaya", style: t2,),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 5.0, bottom: 30.0),
                     alignment: Alignment.bottomLeft,
                    child: Text("Our stoves are heated up!", style: h2,),
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
                  FoodPromo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
