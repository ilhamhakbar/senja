import 'package:flutter/material.dart';
import 'package:senja/pages/splashscreen.dart';
import 'package:senja/pages/homepageMain.dart';



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
    return MaterialApp(
      title: 'Coba',
      theme: ThemeData(
        fontFamily: "SFRegular",
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black
              ),
              color: Colors.white,
              textTheme: TextTheme(
                  title: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  )
              )
          ),
          backgroundColor: Colors.white,
          canvasColor: Colors.white
      ),
      routes: <String, WidgetBuilder>{
        'Home' : (BuildContext context)=> Home(),
      },
      home: SplashScreen(),
    );
  }
}
  // This widget is the root of your application.
