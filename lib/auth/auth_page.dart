import 'package:flutter/material.dart';
import 'package:senja/auth/login_page.dart';
import 'package:senja/pages/home/bottomNavbar.dart';

class AuthPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AuthpageState();
  }
}

class _AuthpageState extends State<AuthPage> {
  bool _isLogin = true;
  void changePage(bool isLogin) {
    setState(() {
      // print(isLogin);
      _isLogin = isLogin;
    });
  }

  // Widget currentPage = LoginPage(changePage());
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 4, // default value
      //   title: Text('Authenticate'),
      // ),
      body: SingleChildScrollView(
        child:  Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(25),
              child: _isLogin ? LoginPage(scaffoldKey: scaffoldKey,) : Home(),

              // Center(
              //     child: Column(
              //       children: <Widget>[
              //       ],
              //     ),
              //   ),
            ),
      ),
    );
  }
}
