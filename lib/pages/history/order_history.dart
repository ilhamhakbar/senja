import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senja/constants/theme.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Text(
                  'Hari Ini',
                  style: h3,
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                  // padding: EdgeInsets.fromLTRB(40, 0, 30, 10),
                  width: sizeHorizontal * 80,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: sizeHorizontal * 10,
                                      width: sizeHorizontal * 10,
                                      child: SvgPicture.asset(
                                          'assets/images/coffee.svg'))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 25, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Es Kopi Susu',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'SFBold',
                                          fontSize: sizeHorizontal * 6,
                                          wordSpacing: -2),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '18:56',
                                      style: t5grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Rp 20.000',
                                      style: TextStyle(
                                          color: Color(0xffe4a153),
                                          fontFamily: 'SFBold',
                                          fontSize: sizeHorizontal * 6,
                                          wordSpacing: -4),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Gopay',
                                      style: t5grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(indent: 10,endIndent: 10,),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
