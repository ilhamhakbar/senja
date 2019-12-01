import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senja/auth/filetest.dart';
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
                      fontFamily: "MignonRegular",
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
                  fontFamily: "MignonRegular",
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
                    fontFamily: "MignonRegular",
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
                  style: h3,
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
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Atau", style: TextStyle(fontFamily: "MignonRegular",
                        fontSize: sizeHorizontal * 5),),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 20),
                          child: InkWell(
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset('assets/images/search.svg', height: 20,),
                                Text('Sign in with Google', style: TextStyle(fontFamily: "MignonRegular",
                          fontSize: sizeHorizontal * 5),),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Tidak punya akun?",
                    style: TextStyle(
                        fontFamily: "MignonRegular",
                        fontSize: sizeHorizontal * 5),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: InkWell(
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color: Color(0xffbe9b7b),
                          fontFamily: "MignonRegular",
                          fontSize: sizeHorizontal * 5,
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
