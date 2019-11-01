import 'package:flutter/material.dart';
import 'package:senja/widget/Order/orderBestSeller.dart';

class OrderPage extends StatefulWidget{
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('AA'),
              backgroundColor: Colors.blue,
            ),
            )
        ],  // title: Text("Order"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OrderBestSeller(), 
          ],
        ),
      ),
    );
  }
}