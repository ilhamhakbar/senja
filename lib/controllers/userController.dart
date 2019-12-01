import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senja/models/user.dart';

saveUserModel (Map jsonRes) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  User gm = User.fromMap(jsonRes);

  prefs.setString("spToken", gm.token);
  prefs.setString("username", gm.data.name);
}