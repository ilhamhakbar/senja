import 'package:flutter/material.dart';
import 'package:senja/pages/history/history.dart';
import 'package:senja/pages/Cafe/cafe.dart';
import 'package:senja/pages/home/homePage.dart';
import 'package:senja/pages/order/orderHomePage.dart';
import 'package:senja/pages/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:senja/provider/menu_provider.dart';



class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  int _selectPage = 0;
  final _pageOptions = [
    HomePage(),
    HistoryPage(),
    null,
    CafePage(),
    ProfilePage(),
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
          icon: Icon(Icons.add,color: Colors.white,size: 40,),
          disabledColor: Colors.green,
        ),
        ),
        body: ChangeNotifierProvider(
          child: _pageOptions[_selectPage], 
          builder: (_) => MenuProvider() ,),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            currentIndex: _selectPage,
            onTap: (int _selectPage) {
              setState(() {
                this._selectPage = _selectPage;
              });
            },
            items: [
              BottomNavigationBarItem(
                  // activeIcon: Icon(Icons.headset),
                  icon: _selectPage==0? new Image.asset('assets/images/home_active.png',height: 30,):new Image.asset('assets/images/home_inactive.png',height: 30), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: _selectPage==1? new Image.asset('assets/images/history_active.png',height: 30):new Image.asset('assets/images/history_inactive.png',height: 30), title: Text('History')),
              BottomNavigationBarItem(
                  icon: Icon(null), title: Text('Order')),
              BottomNavigationBarItem(
                  icon: _selectPage==3? new Image.asset('assets/images/cafe_active.png',height: 30):new Image.asset('assets/images/cafe_inactive.png',height: 30), title: Text('Cafe')),
              BottomNavigationBarItem(
                  icon: _selectPage==4? new Image.asset('assets/images/profile_active.png',height: 30):new Image.asset('assets/images/profile_inactive.png',height: 30), title: Text('Cafe')),
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