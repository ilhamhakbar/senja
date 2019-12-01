import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/widget/cart/cart_list.dart';
import 'package:senja/widget/payment/payment_point.dart';
class CartPage extends StatelessWidget {
  //Init the client ID you URL base
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Pesanan'),
          actions: <Widget>[],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Daftar Pesanan",
                      style: t3,
                    ),
                  )
                ],
              ),
                ),
                Flexible(
                  child: Container(
                    height: 200,
                    child: Cart()),
                ),
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
                      PaymentPoint()
                      ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(child: Text("Total Biaya", style: h3)),
                            Container(
                                child: Text(
                                    "Rp." + model.getCartPrice.toString(),
                                    style: h3)),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xffbe9b7b),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: sizeHorizontal * 90,
                          height: sizeHorizontal * 15,
                          child: Text(
                            "Pesan",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SFBold",
                                fontSize: sizeHorizontal * 6),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
