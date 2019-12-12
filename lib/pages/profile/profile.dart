import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/pages/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes:<String> ['email','https://www.googleapis.com/auth/contacts.readonly']);
  String name;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Trying to logout');
    await prefs.clear();
    _googleSignIn.disconnect();
    print(prefs.getString('spToken'));
    print('Berhasil Logout');

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }
  logoutDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Keluar?", style: h3)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Keluar dari aplikasi senja?", style: t5grey),
                   ],
                ),
                 Container(
                   padding: EdgeInsets.only(top: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                    SizedBox(
                      width: sizeHorizontal * 30,
                      height: sizeHorizontal * 10,
                      child: RaisedButton(
                        color: Color(0xffbe9b7b),
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          style: t5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: sizeHorizontal*5,),
                    SizedBox(
                      width: sizeHorizontal * 30,
                      height: sizeHorizontal * 10,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xffbe9b7b)),
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        textColor: Color(0xffbe9b7b),
                        child: Text(
                          'Keluar',
                          style: t5,
                        ),
                        onPressed: () {
                          _logout();
                        },
                      ),
                    )],),
                 )
              
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f9fe),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: sizeHorizontal * 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: sizeHorizontal * 20,
                    backgroundImage:
                        AssetImage('assets/images/profile_avatar.png'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: sizeHorizontal * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text((name == null)?'Senja User':
                    name,
                    style: h1,
                  )
                ],
              ),
            ),
            Container(),
            Container(
              padding: EdgeInsets.only(top: sizeHorizontal * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '23',
                            style: h2,
                          ),
                        ),
                        Container(
                          child: Text('Total Pesanan',
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 6,
                                  fontFamily: "SFRegular",
                                  color: Colors.black54)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '10/20',
                            style: h2,
                          ),
                        ),
                        Container(
                          child: Text('Jenis Menu',
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 6,
                                  fontFamily: "SFRegular",
                                  color: Colors.black54)),
                        ),
                        Container(
                          child: Text('yang pernah dipesan',
                              style: TextStyle(
                                  fontSize: sizeHorizontal * 4,
                                  fontFamily: "SFRegular",
                                  color: Colors.black54)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeHorizontal * 5,
            ),
            Container(
              height: 200.0,
              width: sizeHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Color(0xfffff9f3),
                          child: Image.asset(
                            'assets/images/profile_active.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Container(
                          width: sizeHorizontal*70,
                            padding: EdgeInsets.fromLTRB(20, 12, 0, 0),
                            child: Text('Ubah Profil', style: t3)),
                        Container(
                          // padding: EdgeInsets.fromLTRB(
                          //     sizeHorizontal * 40, 20, 0, 0),
                          padding: EdgeInsets.only(top: 17),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffbe9b7b),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    endIndent: 30,
                    indent: 30,
                  ),
                  GestureDetector(
                    onTap: () => logoutDialogue(context),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            color: Color(0xfff9f9f8),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                              width: 20,
                              height: 20,
                              child: Icon(Icons.remove,
                                  size: 15, color: Colors.white),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Text('Keluar', style: t2)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _logoutBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           color: Color(0xff737373),
  //           height: 120,
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: const Radius.circular(30),
  //                 topRight: const Radius.circular(30)
  //               )
  //             ),
  //             padding: EdgeInsets.only(top: 10),
  //             child: Column(
  //               children: <Widget>[
  //                 Container(child: Text('Keluar dari aplikasi senja?',style: h3,)),
  //                 Container(
  //                   padding: EdgeInsets.only(top:10),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: <Widget>[
  //                       ButtonTheme(
  //                           minWidth: sizeHorizontal * 20,
  //                           height: sizeHorizontal * 10,
  //                           child: RaisedButton(
  //                             color: Colors.grey,
  //                             shape: new RoundedRectangleBorder(
  //                               borderRadius:
  //                                   BorderRadius.all(Radius.circular(5.0)),
  //                             ),
  //                             padding: EdgeInsets.only(
  //                               left: 50,
  //                               right: 50,
  //                             ),
  //                             textColor: Colors.white,
  //                             child: Text(
  //                               'Keluar',
  //                               style: h4,
  //                             ),
  //                             onPressed: () {},
  //                           )),
  //                            ButtonTheme(
  //                           minWidth: sizeHorizontal * 20,
  //                           height: sizeHorizontal * 10,
  //                           child: RaisedButton(
  //                             color: Color(0xffbe9b7b),
  //                             shape: new RoundedRectangleBorder(
  //                               borderRadius:
  //                                   BorderRadius.all(Radius.circular(5.0)),
  //                             ),
  //                             padding: EdgeInsets.only(
  //                               left: 50,
  //                               right: 50,
  //                             ),
  //                             textColor: Colors.white,
  //                             child: Text(
  //                               'Batal',
  //                               style: h4,
  //                             ),
  //                             onPressed: () {},
  //                           ))
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
  getUser() async{
    setState(() {
      isLoading =true;
    });
  SharedPreferences prefs = await SharedPreferences.getInstance();
  name = prefs.getString("name");
  setState(() {
    isLoading = false;
  });
}
}
