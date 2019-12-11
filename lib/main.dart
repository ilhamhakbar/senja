import 'package:flutter/material.dart';
import 'package:senja/auth/login_page.dart';
import 'package:senja/pages/Splashscreen/splashscreen.dart';
import 'package:senja/auth/auth_page.dart';
import 'package:senja/pages/home/bottomNavbar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/scoped-model/products_model.dart';




void main() => runApp(SenjaApp());

class SenjaApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SenjaAppState();
  }
}

class SenjaAppState extends State<SenjaApp>{

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ProductsModel(),
      child: MaterialApp(
      title: 'Coba',
      theme: ThemeData(
        fontFamily: "SFRegular",
        primarySwatch: Colors.blue,
        primaryColor: Color(0xffbe9b7b),
        appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black
              ),
              color: Colors.white,
              textTheme: TextTheme(
                  title: TextStyle(
                    fontFamily: "SFBold",
                      fontSize: 25,
                      color: Colors.black
                  )
              )
          ),
          backgroundColor: Colors.white,
          canvasColor: Colors.white
      ),
      routes: {
        'AuthPage' : (BuildContext context)=> AuthPage(),
        'Home' : (BuildContext context)=> Home(),
      },
      home: SplashScreen(),
    ),);
  }
}
  // This widget is the root of your application.
