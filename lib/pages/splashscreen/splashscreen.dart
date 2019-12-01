import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  String token;

  @override
  void initState(){
    super.initState();
    forInit();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Color(0xFFbe9b7b)),
          child: Column(
            children: <Widget>[
              Center(child:
              Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.only(top:100),
                  alignment: Alignment.center,
                  child:
                  Image.asset('assets/images/senja_1.png')
              ),
              ),
            ],
          )
      ),
    );
  }

  forInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("spToken");
    // cek login
    //later
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('spToken');
    // print('Cek token : ' + token.toString());
    // String npwp = prefs.getString('spNPWP');
    // print('Ini NPWP :' + npwp.toString());
    Timer(Duration(milliseconds: 1000), (){
      if(token != null){
         Navigator.of(context).pushNamedAndRemoveUntil('Home', (Route<dynamic> route) => false);
      } else{
         Navigator.of(context).pushNamedAndRemoveUntil('AuthPage', (Route<dynamic> route) => false);
      }
    });
    //wait 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }
}