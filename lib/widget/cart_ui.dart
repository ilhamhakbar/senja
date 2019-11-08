import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/widget/cart_list.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child,ProductsModel model ) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'), actions: <Widget>[

            ],
          ),
          body: Cart(),
        );
      }
    );
  }
}