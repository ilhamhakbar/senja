import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:senja/constants/global.dart';
import 'package:senja/auth/signup_page.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/services/api_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  // final BuildContext parentContext;
  final GlobalKey<ScaffoldState> scaffoldKey;

  LoginPage({@required this.scaffoldKey});
  //     : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();}
    });
    _googleSignIn.signInSilently();

  }
  Future <void> _handleGetContact() async {
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      print(response.body);
    }
    // final Map<String, dynamic> data = json.decode(response.body);
    // final String namedContact = _pickFirstNamedContact(data);
    // setState(() {
    //   if (namedContact != null) {
    //     _contactText = "I see you know $namedContact!";
    //   } else {
    //     _contactText = "No contacts to display.";
    //   }
    // });
  }


  _loginwithGoogle() async{
    try{
      _googleSignIn.signIn();
    }
    catch(err){
      print(err);
    }
  }

  doLogin() async {
    await _googleSignIn.signIn();
  }

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController(
      // text: 'vantura.id@gmail.com'
      );
  TextEditingController passwordController = TextEditingController(
      // text: '17081945'
      );

  bool obsecureTextLogin = true;
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  static final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/senja_1.png')),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Selamat datang di',
                      style: t2,
                    ),
                    SizedBox(
                      height: sizeHorizontal * 2,
                    ),
                    Text(
                      'Senja Coffee & Space',
                      style: h1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextFormField(
            focusNode: emailFocusNode,
            controller: emailController,
            style: TextStyle(color: Colors.grey),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                fillColor: Color(0xffe7eaf1),
                filled: true,
                hintText: "E-mail",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SFRegular",
                    fontSize: sizeHorizontal * 5),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.0),
                    borderRadius: BorderRadius.circular(5.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            focusNode: passwordFocusNode,
            controller: passwordController,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "SFRegular",
                fontSize: sizeHorizontal * 5),
            keyboardType: TextInputType.emailAddress,
            obscureText: _isHidePassword,
            decoration: InputDecoration(
              fillColor: Color(0xffe7eaf1),
              filled: true,
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglePasswordVisibility();
                  print(_isHidePassword);
                },
                child: Icon(
                  _isHidePassword ? Icons.visibility : Icons.visibility_off,
                  color: _isHidePassword ? Colors.grey : Colors.blue,
                ),
              ),
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
          ),
          SizedBox(
            height: 15,
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
                'Log In',
                style: h5,
              ),
              onPressed: () async {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                try {
                  await requestLogin(
                      context, emailController.text, passwordController.text);
                  // print(context);
                  showInSnackBar(
                      context, widget.scaffoldKey, 'Sukses Login', 4);
                } catch (e) {
                  showInSnackBar(context, widget.scaffoldKey,
                      e.toString().substring(10), 4);
                  print("Ini error: " + e.toString());
                }
              },
            ),
          ),
          SizedBox(height: 20,),
          ButtonTheme(
            minWidth: sizeHorizontal * 90,
            height: sizeHorizontal * 15,
            child: RaisedButton(
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 50,
              ),
              textColor: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: <Widget>[
                   Container(
                     padding: EdgeInsets.only(right: 20),
                     child: SvgPicture.asset(
                              'assets/images/search.svg',
                              height: 20,
                            ),
                   ),
                  Container(
                    child: Text(
                      'Sign in with Google',
                      style: h5,
                    ),
                  ),
                ],
              ),
              onPressed: (){doLogin(); }
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Tidak punya akun?",
                  style: t5
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: InkWell(
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        color: Color(0xffbe9b7b),
                        fontFamily: "SFRegular",
                        fontSize: sizeHorizontal * 4,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
