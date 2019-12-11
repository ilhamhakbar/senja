import 'package:flutter/material.dart';
import 'package:senja/pages/history/order_history.dart';
import 'package:senja/pages/history/topup_history.dart';
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Color(0xffbe9b7b),
              tabs: [
                Tab(child: Text('Order',style: TextStyle(color: Colors.black, fontFamily: "SFBold"),),),
               Tab(child: Text('Top Up',style: TextStyle(color: Colors.black, fontFamily: "SFBold"),),),
              ],
            ),
            title: Text('History',style: TextStyle(fontFamily: "SFBold", color: Colors.black),),
          ),
          body: TabBarView(
            children: <Widget>[
              OrderHistory(),
              TopupHistory()
            ],
          ),
        ), 
    );
  }
}