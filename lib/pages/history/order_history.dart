import 'package:flutter/material.dart';
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
                Container(
                  // padding: EdgeInsets.fromLTRB(40, 0, 30, 10),
                  color: Colors.white,
                  width: sizeHorizontal * 80,
                  child: Row(children: <Widget>[
                    Container(),
                    Container(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start
                      ,children: <Widget>[
                      Container(child: Text('Es Kopi Susu',style: h3,),),
                      Container(child: Text('18:56', style: t5grey,),)
                    ],),),
                    Container()
                  ],),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
