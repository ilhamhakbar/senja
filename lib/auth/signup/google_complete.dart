import 'package:flutter/material.dart';
import 'package:senja/auth/login_page.dart';
import 'package:senja/auth/signup/google_signin.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleComplete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoogleCompleteState();
  }
}

class _GoogleCompleteState extends State<GoogleComplete> {
  String fullname;
  String password;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _signupData = {
    'phonenumber': null,
    'verication': Null
  };
  
  @override
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController usernameController = TextEditingController(
      text: username
      );
  TextEditingController emailController = TextEditingController(
      text: email
      );

  bool obsecureTextLogin = true;
  bool _isHidePassword = true;

  Future<void> _submit() async {
  }

  @override
  Widget build(BuildContext context) {
    return _buildSignupWidget(_formKey, context: context);
  }

  Scaffold _buildSignupWidget(GlobalKey formkey, {context: BuildContext}) {
    Widget _buildUsernameField() {
      return TextFormField(
        controller: usernameController,
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
            fillColor: Color(0xffe7eaf1),
            filled: true,
            hintText: "Username",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "SF Regular",
                fontSize: sizeHorizontal * 5),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(5.0)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
        onSaved: (String value) {
          _signupData['username'] = value;
        },
      );
    }

    Widget _buildFullnameField() {
      return Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "SFRegular",
                fontSize: sizeHorizontal * 5),
            decoration: InputDecoration(
              fillColor: Color(0xffe7eaf1),
              filled: true,
              hintText: "Nama Lengkap",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "SFRegular",
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
        ],
      );
    }

    Widget _buildPasswordField() {
      return Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "SFRegular",
                fontSize: sizeHorizontal * 5),
            decoration: InputDecoration(
              fillColor: Color(0xffe7eaf1),
              filled: true,
              hintText: "Password",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "SFRegular",
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
        ],
      );
    }

    Widget _buildEmailField() {
      return Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "SFRegular",
                fontSize: sizeHorizontal * 5),
            decoration: InputDecoration(
              fillColor: Color(0xffe7eaf1),
              filled: true,
              hintText: "Email",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "SFRegular",
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
                                        SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Satu langkah lagi!',
                                style: h2,
                              ),
                              SizedBox(
                                height: sizeHorizontal * 2,
                              ),
                              Text(
                                'Kamu perlu memasukkan data berikut untuk melengkapi pendaftaran.',
                                style: TextStyle(
                                    fontFamily: "MignonRegular",
                                    fontSize: sizeHorizontal * 4,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        _buildUsernameField(),
                        SizedBox(
                          height: 15,
                        ),
                        _buildFullnameField(),
                        SizedBox(
                          height: 15,
                        ),
                        _buildPasswordField(),
                        SizedBox(
                          height: 15,
                        ),
                        _buildEmailField(),
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
                              'Submit',
                              style: h5,
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
