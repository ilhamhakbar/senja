import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senja/constants/global.dart';
import 'package:senja/constants/url.dart' as uri;
import 'package:senja/controllers/userController.dart';
import 'package:senja/models/product.dart';
import 'package:senja/models/user.dart';
import 'package:senja/models/transaksi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//Login
Future<User> requestLogin(
  BuildContext context,
  String username,
  String password
) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final loginurl = uri.baseurl + uri.login;

  Map<String, String> body={
    'username': username,
    'password': password
  };

  final response = await http.post(loginurl, body: body);

  if (json.decode(response.body)['status_code'] == 200){
    await saveUserModel(json.decode(response.body));
    prefs.setString('spToken', json.decode(response.body)['token']);
    // print(response.body);
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

Future<List<Product>> getTodaysPicks(
) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final todayspickUrl = uri.baseurl + uri.todayspick;
  final response = await http.get(todayspickUrl, headers: {"Authorization": "Bearer"+prefs.getString('spToken')});
  // print(response.body);
  if(json.decode(response.body)['status_code'] == 200){
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return (jsonResponse['data'] as List).map((data) => Product.fromJson(data)).toList();
  }
}

Future<List<Product>> getProductOutlet1(
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final outlet1url = uri.baseurl + uri.getProduct1;
  final response = await http.get(outlet1url, headers: {"Authorization": "Bearer"+prefs.getString('spToken')});

  if (response.statusCode == 200){
    final jsonResponse = json.decode(response.body);
    return (jsonResponse['data'] as List).map((data) => Product.fromJson(data)).toList();
    // globalProduct = (jsonResponse['data'] as List).map((data) => Product.fromJson(data)).toList();

    // await saveProductModel(json.decode(response.body));

    // print(jsonResponse);
  }else{
    // print(response.statusCode);
    // print(response.body);
  }


  
}


//Bayar Gopay
Future<void> buatTransaksi({
  BuildContext context,
  String paymentType,
  // List<Item> items,
  List<Map<String, dynamic>> lmp,
  Detail transactionDetails,

  Gopay gopay,  
}) async {
  final gopayUrl = uri.gopay;
  DateTime dateTime = DateTime.now();

  Map<String, String> header ={
      'Accept' : 'application/json',
      'Authorization' : 'Basic U0ItTWlkLXNlcnZlci1XRTFrTFp6a3JVRDJOUEt6RXdRTENITV8=',
      'Content-Type' : 'application/json'
  };
  
  Map<String, dynamic> body ={
    'payment_type' : 'gopay',
    'transaction_details' : {
      'order_id' : 'Ilham123_senja_'+dateTime.toString(),
      'gross_amount' : transactionDetails.grossAmount
    },
    'item_details': lmp,
  };
  // print(body);
  // print('ini jsonnya : ');
  print(json.encode(body));

  final response = await http.post(gopayUrl, headers: header, body: json.encode(body));

  if (json.decode(response.body)['status_code'] == '201'){
    print('sukses');
    launch(json.decode(response.body)['actions'][1]['url']);
  }else{
    print(response.body);
  }
}
