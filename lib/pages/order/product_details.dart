import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios)),
                  ],
                )),
            Container(
              height: 350,
              // padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/ricebox.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Rice Box Special',
                    style: h2,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Rp 25.000',
                      style: t4,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.lens,
                      size: sizeHorizontal * 3,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Food & Snack',
                      style: TextStyle(fontSize: sizeHorizontal*5, fontFamily: "MignonRegular", color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Rice box berisikan nasi yang dibalut salted egg. Ditambah dengan potongan chicken katsu, membuat menu ini semakin cocok dalam menemani siangmu. Piihan terbaik untuk mengisi perutmu yang kosong',
                    style: t4,
                  )
                ],
              ),
            ),
            Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle),
                              width: 35.0,
                              height: 35.0,
                              child: Icon(Icons.remove,
                                  size: 20, color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 3.0))),
                            padding: EdgeInsets.fromLTRB(5.0, 5, 5.0, 0),
                            width: 40.0,
                            height: 40.0,
                            child: Text(
                              '1',
                              style: h2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  shape: BoxShape.circle),
                              width: 35.0,
                              height: 35.0,
                              child: Icon(Icons.add,
                                  size: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
