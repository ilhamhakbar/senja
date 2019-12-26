import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/pages/history/history.dart';
import 'package:senja/pages/Cafe/cafe.dart';
import 'package:senja/pages/home/homePage.dart';
import 'package:senja/pages/order/orderHomePage.dart';
import 'package:senja/pages/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:senja/provider/menu_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFFbe9b7b)),
        child: IconButton(
          onPressed: () {
            _selectStore();
            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderHomePage()));
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          disabledColor: Colors.green,
        ),
      ),
      body: ChangeNotifierProvider(
        child: _pageOptions[_selectPage],
        builder: (_) => MenuProvider(),
      ),
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
                icon: _selectPage == 0
                    ? new Image.asset(
                        'assets/images/home_active.png',
                        height: 30,
                      )
                    : new Image.asset('assets/images/home_inactive.png',
                        height: 30),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: _selectPage == 1
                    ? new Image.asset('assets/images/history_active.png',
                        height: 30)
                    : new Image.asset('assets/images/history_inactive.png',
                        height: 30),
                title: Text('History')),
            BottomNavigationBarItem(icon: Icon(null), title: Text('Order')),
            BottomNavigationBarItem(
                icon: _selectPage == 3
                    ? new Image.asset('assets/images/cafe_active.png',
                        height: 30)
                    : new Image.asset('assets/images/cafe_inactive.png',
                        height: 30),
                title: Text('Cafe')),
            BottomNavigationBarItem(
                icon: _selectPage == 4
                    ? new Image.asset('assets/images/profile_active.png',
                        height: 30)
                    : new Image.asset('assets/images/profile_inactive.png',
                        height: 30),
                title: Text('Cafe')),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _selectStore() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
        return Container(
           color: Color(0xFF737373),
          height: 240,
          child: Container(
            child: _selectStoreMenu(),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10)
              )
            ),
          ),
        ); 
        });
  }
  Column _selectStoreMenu(){
    return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Column(children: <Widget>[
                  Container(padding: EdgeInsets.only(bottom: 10),child: Text('Pilih Lokasi',style: TextStyle(fontSize: sizeHorizontal*4.5, fontFamily: 'SFBold'),)),
                  Container(child: Text('Bantu mudahkan barista kami untuk pengantaran pesanan, ya!', style: TextStyle(fontSize: sizeHorizontal*4, fontFamily: 'SFRegular', color: Colors.grey),))
                ],),
              ),
              Divider(
                endIndent: 20,
                indent: 20,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  height: 40,width: 40,child: SvgPicture.asset('assets/images/Frame.svg')),
                title: Text('Senja Lantai 2',style: h4,),
              ),
              Divider(
                endIndent: 20,
                indent: 20,
              ),
               ListTile(
                onTap: () {},
                leading: Container(
                  height: 40,width: 40,child: SvgPicture.asset('assets/images/Frame.svg')),
                title: Text('Senja Lantai 3',style: h4,),
              )
            ],
          );
  }
}
