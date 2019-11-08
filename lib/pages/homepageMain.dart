import 'package:flutter/material.dart';
import 'package:senja/pages/Order/order.dart';
import 'package:senja/pages/ShoppingCart/cartPage.dart';
import 'package:senja/pages/homepage.dart';
import 'package:senja/pages/order/orderPage.dart';


class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  int _selectPage = 0;
  final _pageOptions = [
    HomePage(),
    ShoppingCart(),
    null,
    Text('Item 4'),
    Text('Item 5'),
  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        floatingActionButton: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFbe9b7b)
          ),
          child:  IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderHomePage()));
          },
          icon: Icon(Icons.add,color: Colors.white,),
          disabledColor: Colors.green,
        ),
        ),
        body: _pageOptions[_selectPage],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectPage,
            selectedItemColor: Color(0xFFbe9b7b),
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              if(index != 2){
                
              setState(() {
                _selectPage = index;
              });
              }else{}
            },
            items: [
              BottomNavigationBarItem(
                  // activeIcon: Icon(Icons.headset),
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work), title: Text('History')),
              BottomNavigationBarItem(
                  icon: Icon(null), title: Text('Order')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('Inbox')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Account')),
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }

  snackbar()=>SnackBar(
    content: Container(
      height: 300,
      child: Text('wew dude'),
    ),
  );
}