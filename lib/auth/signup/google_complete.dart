import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senja/auth/login_page.dart';
import 'package:senja/auth/signup/google_signin.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/services/api_services.dart';
import 'package:senja/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleComplete extends StatefulWidget {
  final String username;
  final String fullname;
  final String email;
  final String password;
  final String phoneNumber;
  GoogleComplete(
      {this.email,
      this.username,
      this.fullname,
      this.password,
      this.phoneNumber});
  @override
  State<StatefulWidget> createState() {
    return _GoogleCompleteState();
  }
}

class _GoogleCompleteState extends State<GoogleComplete> {
  @override
  FocusNode usernameFocusNode = FocusNode();
  FocusNode fullnameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController usernameController =
      TextEditingController(text: username);
  TextEditingController fullnameController = TextEditingController(
      // text: username
      );
  TextEditingController passwordController = TextEditingController(
      // text: username
      );
  TextEditingController emailController = TextEditingController(text: email);
  TextEditingController phoneNumberController =
      TextEditingController(text: '085641728881');

  bool obsecureTextLogin = true;
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  init() {
    if (widget.username != null) {
      usernameController.text = widget.username;
    }
    if (widget.fullname != null) {
      fullnameController.text = widget.fullname;
    }
    if (widget.password != null) {
      passwordController.text = widget.password;
    }
    if (widget.email != null) {
      emailController.text = widget.email;
    }
    if (widget.phoneNumber != null) {
      phoneNumberController.text = widget.phoneNumber;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
                            TextFormField(
                              enabled: false,
                              focusNode: usernameFocusNode,
                              controller: usernameController,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "SFRegular",
                                  fontSize: sizeHorizontal * 5),
                              decoration: InputDecoration(
                                  fillColor: Color(0xffe7eaf1),
                                  filled: true,
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SF Regular",
                                      fontSize: sizeHorizontal * 5),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextFormField(
                                  controller: fullnameController,
                                  focusNode: fullnameFocusNode,
                                  style: TextStyle(
                                      color: Colors.black,
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextFormField(
                                  controller: passwordController,
                                  focusNode: passwordFocusNode,
                                  obscureText: _isHidePassword,
                                  style: TextStyle(
                                      color: Colors.black,
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
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _togglePasswordVisibility();
                                        print(_isHidePassword);
                                      },
                                      child: Icon(
                                        _isHidePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: _isHidePassword
                                            ? Colors.grey
                                            : Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextFormField(
                                  focusNode: emailFocusNode,
                                  enabled: false,
                                  controller: emailController,
                                  style: TextStyle(
                                      color: Colors.black,
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
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ],
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
                                onPressed: () async {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                  try {
                                    await registerWithGmail(
                                        context,
                                        usernameController.text,
                                        passwordController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        fullnameController.text);
                                    // print(context);
                                    showInSnackBar(context, scaffoldKey,
                                        'Sukses Login', 4);
                                  } catch (e) {
                                    showInSnackBar(context, scaffoldKey,
                                        e.toString().substring(10), 4);
                                    print("Ini error: " + e.toString());
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
    ;
  }
}
