import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senja/constants/url.dart' as uri;
import 'package:senja/controllers/userController.dart';
import 'package:senja/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Login
Future<User> requestLogin(
  BuildContext context,
  String email,
  String password
) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final url = uri.baseurl + uri.login;

  Map<String, String> body={
    'email': email,
    'password': password
  };

  final response = await http.post(url, body: body);

  if (json.decode(response.body)['status_code'] == 200){
    // await saveUserModel(json.decode(response.body));
    prefs.setString('spToken', json.decode(response.body)['token']);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('Home', (Route<dynamic> route) => false);
    throw new Exception("Anda sukses login");
  }
  // else if (json.decode(response.body)['status_code'] == 403 &&
  //     json.decode(response.body)['message'] ==
  //         "Email") {
  //   throw new Exception("Nomor Induk tidak tersedia");
  // } else if (json.decode(response.body)['status_code'] == 403 &&
  //     json.decode(response.body)['message'] ==
  //         "Password tidak sesuai, Silahkan periksa ulang password anda.") {
  //   throw new Exception("Kode Sekolah tidak tersedia");   
  // }
  else {
    throw new Exception(json.decode(response.body)['message']);
  }
}