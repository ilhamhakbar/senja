import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/card/product_card.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage(){
    return ListView(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.all(16),
        //   child: Text(
        //     'Your favourites',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18,
        //       fontFamily: 'Lato',
        //     ),
        //   ),
        // ),
        // MenuListView(true),
        // Divider(),
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            'Best Seller',
            style: h3 ,
          ),
        ),
        MenuListView(false),
        Divider(),
      ],
    );
  }
}