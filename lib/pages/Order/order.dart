import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/pages/Order/orderPage.dart';
import 'package:senja/widget/cart_ui.dart';

class OrderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (
        BuildContext context,
        Widget child,
        ProductsModel model,
      ) {
        return Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: <Widget>[
                OrderPage(),
                 model.getCartList.length >0 ? Positioned(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        height: 75,
                        color: Colors.green,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 25),
                                height: 75,
                                alignment: FractionalOffset.centerLeft,
                                child: Text(
                                  '${model.getCartList.length} Items\n Rs. ${model.getCartPrice} ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 25),
                                height: 75,
                                alignment: FractionalOffset.centerRight,
                                child: FlatButton(
                                  // color: Colors.white,
                                  child: Text(
                                    'View Cart',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) => CartPage()
                                    ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ) : Container(),
              ],
            ));
      },
    );
  }
}
