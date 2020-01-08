import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senja/auth/login_page.dart';
import 'package:senja/auth/signup/phone_complete.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneVerification extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  PhoneVerification({@required this.scaffoldKey});

  @override
  State<StatefulWidget> createState() {
    return _PhoneVerificationState();
  }
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String _message = '';
  String _verificationId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, dynamic> _signupData = {
    'phonenumber': null,
    'verication': Null
  };

  @override
  initState() {
    super.initState();
    init();
  }

  bool isPhoneNumberFilled = false;

  formValidation() {
    if (_phoneNumberController.text.length > 5) {
      print('yoot');
      setState(() {
        isPhoneNumberFilled = true;
      });
    } else {
      setState(() {
        isPhoneNumberFilled = false;
      });
    }
  }

  init() {
    _phoneNumberController.addListener(formValidation);
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
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(0.0),
                                        child: GestureDetector(
                                            onTap: () {},
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
                                        fontFamily: "SFRegular",
                                        fontSize: sizeHorizontal * 4,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         padding: EdgeInsets.only(right: 20),
                            //         width: sizeHorizontal*20,child: _buildNationCode()),
                            //       Container(width: sizeHorizontal*65,child: ),
                            //     ],
                            //   ),
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  width: sizeHorizontal * 15,
                                  child: TextFormField(
                                    enabled: false,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        // prefixIcon: Padding(
                                        //       padding: EdgeInsets.all(0.0),
                                        //       child: Container(width: 10,color: Colors.white,child: Text('+62',style: TextStyle(
                                        //       color: Colors.grey,
                                        //       fontFamily: "SFRegular",
                                        //       fontSize: sizeHorizontal * 5),),),
                                        //     ),
                                        fillColor: Color(0xffe7eaf1),
                                        filled: true,
                                        hintText: "+62",
                                        hintStyle: TextStyle(
                                            color: Colors.black,
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
                                                Radius.circular(5.0)))),
                                  ),
                                ),
                                Container(
                                  width: sizeHorizontal * 70,
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: <Widget>[
                                      TextFormField(
                                        keyboardType: TextInputType.phone,
                                        controller: _phoneNumberController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            // prefixIcon: Padding(
                                            //       padding: EdgeInsets.all(0.0),
                                            //       child: Container(width: 10,color: Colors.white,child: Text('+62',style: TextStyle(
                                            //       color: Colors.grey,
                                            //       fontFamily: "SFRegular",
                                            //       fontSize: sizeHorizontal * 5),),),
                                            //     ),
                                            fillColor: Color(0xffe7eaf1),
                                            filled: true,
                                            hintText: "(81212341234)",
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
                                                    Radius.circular(5.0)))),
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Phone number (+62 xx-xxx-xxx-xxx)';
                                          }
                                          return null;
                                        },
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: GestureDetector(
                                          onTap: (isPhoneNumberFilled)
                                              ? () async {
                                                  if (_phoneNumberController
                                                          .text ==
                                                      '') {
                                                    showInSnackBar(
                                                        context,
                                                        scaffoldKey,
                                                        'Please enter phone number',
                                                        2);
                                                  } else {
                                                    _verifyPhoneNumber();
                                                    SystemChannels.textInput
                                                        .invokeMethod(
                                                            'TextInput.hide');
                                                    showInSnackBar(
                                                        context,
                                                        scaffoldKey,
                                                        'Please check your phone for the verification code',
                                                        4);
                                                  }
                                                  // _verifyPhoneNumber();
                                                }
                                              : null,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: (isPhoneNumberFilled)
                                                    ? senjaBrown
                                                    : Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Text(
                                              'Send Code',
                                              style: t4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                  controller: _smsController,
                                   keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SFRegular",
                                      fontSize: sizeHorizontal * 5),
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffe7eaf1),
                                    filled: true,
                                    hintText: "Masukkan 6 digit kode verifikasi",
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
                                  'Daftar',
                                  style: h5,
                                ),
                                onPressed: () async {
                                  _signInWithPhoneNumber();
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

  Scaffold _buildSignupWidget(
    GlobalKey formkey,
  ) {
    return Scaffold(
        body: Builder(
            builder: (context) => SingleChildScrollView(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                padding: EdgeInsets.all(0.0),
                                                child: GestureDetector(
                                                    onTap: () {},
                                                    child: Icon(
                                                        Icons.arrow_back_ios))),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                fontFamily: "SFRegular",
                                                fontSize: sizeHorizontal * 4,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   child: Row(
                                    //     children: <Widget>[
                                    //       Container(
                                    //         padding: EdgeInsets.only(right: 20),
                                    //         width: sizeHorizontal*20,child: _buildNationCode()),
                                    //       Container(width: sizeHorizontal*65,child: ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Stack(
                                        alignment: Alignment.centerRight,
                                        children: <Widget>[
                                          TextFormField(
                                            controller: _phoneNumberController,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: InputDecoration(
                                                fillColor: Color(0xffe7eaf1),
                                                filled: true,
                                                hintText:
                                                    "(cth. +6281212341234)",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: "SFRegular",
                                                    fontSize:
                                                        sizeHorizontal * 5),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)))),
                                            validator: (String value) {
                                              if (value.isEmpty) {
                                                return 'Phone number (+62 xx-xxx-xxx-xxx)';
                                              }
                                              return null;
                                            },
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: GestureDetector(
                                              onTap: () async {
                                                _verifyPhoneNumber();
                                                SystemChannels.textInput
                                                    .invokeMethod(
                                                        'TextInput.hide');
                                                showInSnackBar(
                                                    context,
                                                    widget.scaffoldKey,
                                                    'Please check your phone for the verification code',
                                                    4);

                                                // _verifyPhoneNumber();
                                              },
                                              child: RaisedButton(
                                                color: Colors.green,
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                ),
                                                textColor: Colors.white,
                                                child: Text(
                                                  "Send Code",
                                                  style: t4,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),

                                    SizedBox(
                                      height: 15,
                                    ),

                                    TextFormField(
                                      controller: _smsController,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "SFRegular",
                                          fontSize: sizeHorizontal * 5),
                                      decoration: InputDecoration(
                                        fillColor: Color(0xffe7eaf1),
                                        filled: true,
                                        hintText: "Masukkan kode verif",
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
                                      onSaved: (String value) {
                                        _signupData['verification'] = value;
                                      },
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        padding: EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                        ),
                                        // color: Theme.of(context).buttonColor,
                                        textColor: Colors.white,
                                        child: Text(
                                          'Daftar',
                                          style: h5,
                                        ),
                                        onPressed: () async {
                                          _signInWithPhoneNumber();
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
                )));
  }

  // Example code of how to verify phone number
  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
        showInSnackBar(context, scaffoldKey, _message, 3);
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      final snackBar = SnackBar(
        content: Text(
          'Please check your phone for the verification code',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontFamily: "SFRegular"),
        ),
        backgroundColor: senjaBrown,
        duration: Duration(milliseconds: 2000),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: '+62' + _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PhoneComplete(
                    phoneNumber: _phoneNumberController.text,
                  )),
        );
      } else {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        showInSnackBar(
            context, scaffoldKey, 'Verifikasi nomor telepon gagal', 3);
      }
    });
  }
}
