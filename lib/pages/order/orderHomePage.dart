import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/pages/Order/order.dart';
import 'package:senja/pages/order/cart/cart_ui.dart';

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
                Order(),
                 model.getCartList.length >0 ? Positioned(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        height: 75,
                        color: Color(0xffbe9b7b),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 25),
                                 height: 75,
                                  alignment: FractionalOffset.centerLeft,
                                child: Icon(IconData(0xe900, fontFamily: 'Shoppingbag',),color: Colors.white,),
                              ),  
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                height: 75,
                                alignment: FractionalOffset.centerLeft,
                                child: FlatButton(
                                  // color: Colors.white,
                                  child: Text(
                                    'Order',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: sizeHorizontal * 6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) => CartPage()
                                    ));
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 110),
                                height: 75,
                                alignment: FractionalOffset.centerRight,
                                child: Text(
                                  '${model.getCartList.length} Items',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.only(right: 95),
                              //   height: 70,
                              //   alignment: FractionalOffset.centerRight,
                              //   child: Text(
                              //     '.',
                              //     style: TextStyle(color: Colors.white, fontSize: sizeHorizontal * 12),textAlign: TextAlign.center,
                              //   ),
                              // ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 75,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Rp. ${model.getCartPrice} ',
                                  style: TextStyle(color: Colors.white),
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
