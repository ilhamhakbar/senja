import 'package:flutter/material.dart';
import 'package:senja/pages/homepage.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/pages/order/orderPage.dart';


class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  int _selectPage = 0;
  final _pageOptions = [
    HomePage(),
    Text('Item 2'),
    Home(),
    Text('Item 4'),
    Text('Item 5'),
  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFbe9b7b),
        ),
        body: _pageOptions[_selectPage],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectPage,
            selectedItemColor: Color(0xFFbe9b7b),
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              setState(() {
                _selectPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  // activeIcon: Icon(Icons.headset),
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work), title: Text('Order')),
              BottomNavigationBarItem(
                  icon: Icon(null), title: Text('Chat')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('Inbox')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Account')),
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }
}