import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/pages/order/seat/tempat_duduk_screen.dart';
import 'package:senja/pages/order/cart/cart_list.dart';
import 'package:senja/pages/order/payment/Gopay/waiting_gopay.dart';
import 'package:senja/pages/order/payment/payment_point.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  String orderId;
  CartPage({this.orderId});
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>{
   DateTime datetime = DateTime.now();
    String name;
    bool isLoading = false;
    String order_id;
    PaymentPoint paymentPoint =PaymentPoint();

    @override
  void initState(){
    super.initState();
    getUser();
  }
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
                            ),
                            GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TempatDudukScreen()));
                          },
                          child: Container(
                            // height: 20,
                            // width: 50,
                            color: senjaBrown,
                            child: Text('Pilih Tempat Duduk'),
                          ),
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
                      paymentPoint,
                      orderPesanContainer(model)
                      // PaymentPoint()
                      ],
                  ),
              ),
                
              ],
            ),
          ),
        ),
      );
    });
  }

  orderPesanContainer(ProductsModel model){
    return Container(
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
                          // print('payment sekarang : '+paymentPoint.paymentMethod);
                          model.clearItemMap();
                          model.addToMap();

                          Navigator.push(context, MaterialPageRoute(builder: (context) => WaitingGopay()));
                        
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
                );
  }

  getUser() async{
    setState(() {
      isLoading =true;
    });
  SharedPreferences prefs = await SharedPreferences.getInstance();
  name = prefs.getString("name");
  order_id = name + '_senja_' + datetime.toString();
  setState(() {
    isLoading = false;
  });
}
}
