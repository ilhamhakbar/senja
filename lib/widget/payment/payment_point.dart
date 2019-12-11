import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';

class PaymentPoint extends StatefulWidget {

  final state = PaymentPointState();
  @override
  State<StatefulWidget> createState() {
    return state;
  }

  String get paymentMethod => state.method;


}

class PaymentPointState extends State<PaymentPoint> {
  Color _goPayColor = Colors.white;
  Color _ovoColor = Colors.white;
  Color _creditColor = Colors.white;
  String method = '';

  paymentMethod(){
    if(_goPayColor != Colors.white ){
      return  'gopay';
    }
    else if(_ovoColor != Colors.white){
            return  'ovo';

    }
    else if(_creditColor != Colors.white){
            return  'credit';

    }
    else{
            return  'notvalid';

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
              _goPayColor = Color(0xffbe9b7b);
              _ovoColor = Colors.white;
              _creditColor = Colors.white;
              method = 'gopay';
              });
              
            },
            child: Container(
              padding: EdgeInsets.all(5),
              width: sizeHorizontal * 25,
              height: sizeHorizontal * 25,
              decoration: BoxDecoration(
                border: Border.all(color: _goPayColor , width: 2.0),
                color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(3, 3),
                    blurRadius: 20.0)
              ]),
              child: Column(
                children: <Widget>[
                  Container(
                    width: sizeHorizontal * 15,
                    height: sizeHorizontal * 15,
                    // padding: EdgeInsets.all(10),
                    child: Image.asset("assets/images/gopay.png"),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Gopay",
                      style: TextStyle(fontFamily: "SFBold"),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
              _goPayColor = Colors.white;
              _ovoColor = Color(0xffbe9b7b);
              _creditColor = Colors.white;
                            method = 'ovo';

              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              width: sizeHorizontal * 25,
              height: sizeHorizontal * 25,
              decoration: BoxDecoration(
                border: Border.all(color: _ovoColor , width: 2.0),color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(3, 3),
                    blurRadius: 20.0)
              ]),
              child: Column(
                children: <Widget>[
                  Container(
                    width: sizeHorizontal * 15,
                    height: sizeHorizontal * 15,
                    padding: EdgeInsets.all(5),
                    child: Image.asset("assets/images/ovo.jpg"),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "OVO",
                      style: TextStyle(fontFamily: "SFBold"),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
              _goPayColor = Colors.white;
              _ovoColor = Colors.white;
              _creditColor = Color(0xffbe9b7b);
                            method = 'credit';

              });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: sizeHorizontal * 25,
                height: sizeHorizontal * 25,
                decoration: BoxDecoration(
                  border: Border.all(color: _creditColor , width: 2.0),color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(3, 3),
                      blurRadius: 20.0)
                ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: sizeHorizontal * 15,
                      height: sizeHorizontal * 15,
                      padding: EdgeInsets.all(5),
                      child: Image.asset("assets/images/bca.png"),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Transfer BCA",
                        style: TextStyle(fontFamily: "SFBold"),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
