import 'package:flutter/material.dart';

double sizeHorizontal;
double sizeVertical;

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    sizeHorizontal = safeBlockHorizontal;
    sizeVertical = safeBlockVertical;

    print(
        'safe block horizontal : $safeBlockHorizontal, vertical : $safeBlockVertical');
  }
}

//------------------------------------------TEXTSTYLE
TextStyle h1 =
    TextStyle(fontSize: sizeHorizontal * 8.5, fontFamily: "MignonBold");

TextStyle h2 =
    TextStyle(fontSize: sizeHorizontal * 7, fontFamily: "MignonBold");

TextStyle h3 =
    TextStyle(fontSize: sizeHorizontal * 6, fontFamily: "MignonBold");

TextStyle h4 =
    TextStyle(fontSize: sizeHorizontal * 5, fontFamily: "MignonBold");

TextStyle h5 =
    TextStyle(fontSize: sizeHorizontal * 4, fontFamily: "MignonBold");

TextStyle t1 = TextStyle(
  fontSize: sizeHorizontal * 8.5,
);

TextStyle t2 =
    TextStyle(fontSize: sizeHorizontal * 6, fontFamily: "MignonRegular");

TextStyle t3 =
    TextStyle(fontSize: sizeHorizontal * 5.5, fontFamily: "MignonRegular");

TextStyle t3Url = TextStyle(fontSize: sizeHorizontal * 3, color: Colors.blue);

TextStyle t4 =
    TextStyle(fontSize: sizeHorizontal * 5, fontFamily: "MignonRegular");

TextStyle t5 =
    TextStyle(fontSize: sizeHorizontal * 4, fontFamily: "MignonRegular");
TextStyle t5grey = TextStyle(fontSize: sizeHorizontal*4, fontFamily: "MignonRegular", color: Colors.grey);
TextStyle ctaOrange = TextStyle(
    fontSize: sizeHorizontal * 4,
//    fontWeight: FontWeight.bold,
    color: Colors.white);

TextStyle ctaWhite = TextStyle(
  color: Colors.orange,
  fontSize: sizeHorizontal * 4,
//    fontWeight: FontWeight.bold
);

TextStyle c4(Color color) {
  return TextStyle(
      fontSize: sizeHorizontal * 6, fontFamily: "SFBold", color: color);
}

Container loadingBox({
  double width,
  double height
}){
  return Container(
    width:width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.grey[200],
    ),
  );
}
//------------------------------------------
