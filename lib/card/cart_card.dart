import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/product.dart';

class CartCard extends StatelessWidget {
  final Product product;
  CartCard(this.product);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('value'),
      onDismissed: (DismissDirection direction) {},
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.green,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
               Container(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "2x",
                      style: TextStyle(
                          fontSize: sizeHorizontal * 5,
                          fontFamily: "SFBold",
                          color: Colors.green),
                    ),
                  ),
              Flexible(
                child: Container(
                  height: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          product.title,
                          style: TextStyle(
                                  fontSize: sizeHorizontal * 4.5,
                                  fontFamily: "SFBold")
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Rp "+
                          product.price.toString(),
                          style: TextStyle(
                            fontSize: sizeHorizontal * 4,
                                  fontFamily: "SFRegular",
                                  color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               Container(
                 alignment: Alignment.centerRight,
                    width: 25.0,
                    height: 25.0,
                    child: FlatButton(
                      onPressed: () => {},
                      child: Icon(Icons.remove, size: 15),
                    ),
                  ),
            ],
          ),
          Divider(),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Pesan Tempat Duduk",
                          style: t3,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 90.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Coba Gunakan?",
                          style: TextStyle(
                              fontSize: sizeHorizontal * 3.5,
                              fontFamily: "SFRegular",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Pilih Metode Pembayaran",
                          style: t3,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          width: sizeHorizontal * 25,
                          height: sizeHorizontal * 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(3,3),
                              blurRadius: 20.0
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: sizeHorizontal * 15,
                                height: sizeHorizontal * 15,
                                // padding: EdgeInsets.all(10),
                                child: Image.asset("assets/images/gopay.png"),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Gopay", style: TextStyle(fontFamily:"SFBold"),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: sizeHorizontal * 25,
                          height: sizeHorizontal * 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(3,3),
                              blurRadius: 20.0
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: sizeHorizontal * 15,
                                height: sizeHorizontal * 15,
                                padding: EdgeInsets.all(5),
                                child: Image.asset("assets/images/ovo.jpg"),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("OVO",style: TextStyle(fontFamily:"SFBold"),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: sizeHorizontal * 25,
                          height: sizeHorizontal * 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(3,3),
                              blurRadius: 20.0
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: sizeHorizontal* 15,
                                height: sizeHorizontal *15,
                                padding: EdgeInsets.all(5),
                                child: Image.asset("assets/images/cc.png"),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Kartu Kredit",style: TextStyle(fontFamily:"SFBold"),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        ],
      ),
      
    );
  }
}
