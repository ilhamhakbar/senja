import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Pesanan",
          style: h2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
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
            Container(
              color: Colors.white,
              child: Row(
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Es Kopi Senja",
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 4.5,
                                  fontFamily: "SFBold")),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text("Rp 36.000",
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 4,
                                  fontFamily: "SFRegular",
                                  color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 25.0,
                    height: 25.0,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xffd65a5a),
                      onPressed: () {},
                      child: Icon(Icons.remove, size: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Es Kopi Senja",
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 4.5,
                                  fontFamily: "SFBold")),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text("Rp 36.000",
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 4,
                                  fontFamily: "SFRegular",
                                  color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 25.0,
                    height: 25.0,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xffd65a5a),
                      onPressed: () {},
                      child: Icon(Icons.remove, size: 15),
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
