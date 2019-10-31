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
                  fit: BoxFit.fill,
                  color: Colors.white,
                  colorBlendMode: BlendMode.darken,
                  ),
                  Container(
                    child: Text("Morning, Benaya"),
                  ),
                  Container(
                    child: Text("Our Stoves are heated up!"),
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
