import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/models/product.dart';
import 'package:senja/scoped-model/products_model.dart';

class BestSellerCard extends StatefulWidget {

  final Product product;
  final ProductsModel model;

  BestSellerCard({this.model, this.product});

  @override
  _BestSellerCardState createState() => _BestSellerCardState();
}

class _BestSellerCardState extends State<BestSellerCard> {

    bool showminus = false;


  void incrementCounterPlus(){
      if(widget.product.quantity == 0){
      setState(() {
        showminus = true;
      });
    }
    }
    void incrementCounterMinus(){
      if(widget.product.quantity == 0){
        setState(() {
          showminus = false;
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
          child: Container(
            width: sizeHorizontal*70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.product.image), fit: BoxFit.cover),
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
                          alignment: Alignment.topLeft,
                          child: Text(widget.product.title, style: h4)),
                      Container(
                        width: sizeHorizontal * 45,
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          widget.product.description,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Rp ' + widget.product.price.toString(),
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0, bottom: 40.0),
          child: Column(
            children: <Widget>[
              Container(
                // width: 75,
                child: Row(
                  children: <Widget>[
                    (widget.product.quantity != 0)
                    ?
                    // (buttonMinus)
                    Container(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              widget.model.removeFromCart(widget.product);
                              incrementCounterMinus();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle),
                              width: 25.0,
                              height: 25.0,
                              child: Icon(Icons.remove,
                                  size: 15, color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 3.0))),
                            padding: EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 0),
                            width: 30.0,
                            height: 30.0,
                            child: Text(
                              widget.product.quantity.toString(),
                              style: h4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.model.addToCart(widget.product);
                              incrementCounterPlus();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  shape: BoxShape.circle),
                              width: 25.0,
                              height: 25.0,
                              child: Icon(Icons.add,
                                  size: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ): Container(
                      child: Row(
                        children: <Widget>[
                            Container(
                            padding: EdgeInsets.only(left: 15.0, top: 2.5),
                        width: 40.0,
                        height: 30.0,
                          ),
                          InkWell(
                            onTap: (){
                              widget.model.addToCart(widget.product);
                              showminus = true;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  shape: BoxShape.circle),
                              width: 25.0,
                              height: 25.0,
                              child: Icon(Icons.add,
                                  size: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}