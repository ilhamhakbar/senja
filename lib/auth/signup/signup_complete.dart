import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/services/api_services.dart';

class SignupComplete extends StatefulWidget {
  @override
  _SignupCompleteState createState() => _SignupCompleteState();
}

class _SignupCompleteState extends State<SignupComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 175,
              ),
              Container(
                child: Image.asset('assets/images/regis_success_02.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Pendaftaran Berhasil!',
                      style: h2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: sizeHorizontal * 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sekarang kamu dapat menikmati suasana senja.',
                      style: c4(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dapatkan berbagai promo menarik ',
                      style: c4(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'dengan menggunakan aplikasi Senja.',
                      style: c4(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ButtonTheme(
                minWidth: sizeHorizontal * 90,
                height: sizeHorizontal * 15,
                child: RaisedButton(
                  color: Color(0xffbe9b7b),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  textColor: Colors.white,
                  child: Text(
                    'Kembali ke Login',
                    style: h5,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'AuthPage', (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
