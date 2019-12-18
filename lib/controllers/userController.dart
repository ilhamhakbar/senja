import 'dart:convert';
import 'package:senja/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senja/models/user.dart';
import 'package:senja/constants/global.dart' as globals;

saveUserModel (Map jsonRes) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  User gm = User.fromMap(jsonRes);
  print('isi response'+jsonRes.toString());
  print(gm.data.name);
  print(gm.data.email);

  prefs.setString("spToken", gm.token);
  prefs.setString("name", gm.data.name);
}

// saveProductModel(Map jsonRes) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   Product pr = globals.globalProduct.first;

//   var idProduct = (json != null && jsonRes.isNotEmpty) ? pr.id : "0";

//   // prefs.setInt(key, value)
// }
