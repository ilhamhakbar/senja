import 'package:flutter/material.dart';
import 'package:senja/auth/login_page.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _signupData = {
    'phonenumber': null,
    'verication': Null
  };

  @override
  Widget build(BuildContext context) {
    return _buildSignupWidget(_formKey, context: context);
  }

  Scaffold _buildSignupWidget(GlobalKey formkey, {context: BuildContext}) {
    Widget _buildPhoneNumberField() {
      return TextFormField(
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
            fillColor: Color(0xffe7eaf1),
            filled: true,
            hintText: "(cth. 081212341234)",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "MignonRegular",
                fontSize: sizeHorizontal * 5),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(5.0)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
        onSaved: (String value) {
          _signupData['phonenumber'] = value;
        },
      );
    }

    Widget _buildVerificationField() {
      return Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "MignonRegular",
                fontSize: sizeHorizontal * 5),
            decoration: InputDecoration(
              fillColor: Color(0xffe7eaf1),
              filled: true,
              hintText: "Masukkan kode verif",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "MignonRegular",
                  fontSize: sizeHorizontal * 5),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: BorderRadius.circular(5.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            onSaved: (String value) {
              _signupData['verification'] = value;
            },
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: GestureDetector(
                  onTap: () {},
                  child: RaisedButton(
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    textColor: Colors.white,
                      child: Text(
                      "Send Code",
                      style: t4,
                    ),
                  ),
                ),
          ),
        ],
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.arrow_back_ios))),
                                Container(
                                    height: 150,
                                    width: 150,
                                    child: Image.asset(
                                        'assets/images/senja_1.png')),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Masukkan Nomor Hp',
                                style: h2,
                              ),
                              SizedBox(
                                height: sizeHorizontal * 2,
                              ),
                              Text(
                                'Silakan login dahulu untuk memulai menikmati suasana senja',
                                style: TextStyle(
                                    fontFamily: "MignonRegular",
                                    fontSize: sizeHorizontal * 4,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        _buildPhoneNumberField(),
                        SizedBox(
                          height: 15,
                        ),
                        _buildVerificationField(),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonTheme(
                          minWidth: sizeHorizontal * 90,
                          height: sizeHorizontal * 15,
                          child: RaisedButton(
                            color: Color(0xffbe9b7b),
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                            ),
                            // color: Theme.of(context).buttonColor,
                            textColor: Colors.white,
                            child: Text(
                              'Daftar',
                              style: h3,
                            ),
                            onPressed: () {
                              _formKey.currentState.save();
                              if (!_formKey.currentState.validate()) {
                                return;
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
