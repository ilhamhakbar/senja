import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';


//Colors
const Color senjaBrown = Color(0xffbe9b7b);
const Color successGreen = Color(0xFF8bc24a);
const Color dangerRed = Color(0xFFff4421);
const Color warningOrange = Color(0xffff9700);
const Color kursiKosong = Color(0xff02c39a);
const Color kursiTerisi = Color(0xffffffff);
const Color kursiPenuh = Color(0xffcccccc);

//SnackBar
void showInSnackBar(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
    String value, int status) {
  Color color;
  if (status == 1) {
    color = successGreen;
  } else if (status == 2) {
    color = warningOrange;
  } else if (status == 3) {
    color = dangerRed;
  } else if (status == 4) {
    color = senjaBrown;
  }
  FocusScope.of(context).requestFocus(FocusNode());
  _scaffoldKey.currentState?.removeCurrentSnackBar();
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16.0, fontFamily: "InterUI"),
    ),
    backgroundColor: color,
    duration: Duration(milliseconds: 2000),
  ));
}
