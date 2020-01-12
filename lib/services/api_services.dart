import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senja/auth/signup/signup_complete.dart';
import 'package:senja/constants/global.dart';
import 'package:senja/constants/url.dart' as uri;
import 'package:senja/controllers/userController.dart';
import 'package:senja/models/product.dart';
import 'package:senja/models/category.dart';
import 'package:senja/models/user.dart';
import 'package:senja/models/transaksi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//Register
Future<User> registerWithPhone(BuildContext context, String username,
    String password, String email, String phone, String fullname) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final registerurl = uri.baseurl + uri.register;

  Map<String, String> body = {
    'username': username,
    'password': password,
    'email': username + '@vantura.id',
    'phone': '+62' + phone,
    'name': fullname,
    'shop_id': '2'
  };

  final response = await http.post(registerurl, body: body);
  if (response.statusCode == 200) {
    Navigator.pop(context);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => SignupComplete()),
      ModalRoute.withName('AuthPage'),
    );
    throw new Exception("Registerasi berhasil!");
  }
}

Future<User> registerWithGmail(BuildContext context, String username,
    String password, String email, String phone, String fullname) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final registerurl = uri.baseurl + uri.register;

  Map<String, String> body = {
    'username': username,
    'password': password,
    'email': email,
    'phone': phone,
    'name': fullname,
    'shop_id': '2'
  };

  // await checkEmail(context: context,email: email);

  final response = await http.post(registerurl, body: body);
  print(body);
  print(response.body);
  if (response.statusCode == 200) {
    Navigator.pop(context);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => SignupComplete()),
      ModalRoute.withName('AuthPage'),
    );
    throw new Exception("Registerasi berhasil!");
  }
}

//Login
Future<User> requestLogin(
    BuildContext context, String username, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final loginurl = uri.baseurl + uri.login;

  Map<String, String> body = {'username': username, 'password': password};

  final response = await http.post(loginurl, body: body);

  if (json.decode(response.body)['status_code'] == 200) {
    await saveUserModel(json.decode(response.body));
    prefs.setString('spToken', json.decode(response.body)['token']);
    // print(response.body);
    Navigator.pop(context);
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

Future<List<Category>> getCategory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final categoryUrl = uri.baseurl + uri.category;
  final response = await http.get(categoryUrl,
      headers: {"Authorization": "Bearer" + prefs.getString('spToken')});

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return (jsonResponse['data'] as List)
        .map((data) => Category.fromJson(data))
        .toList();
  }
}

Future<List<Product>> getTodaysPicks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final todayspickUrl = uri.baseurl + uri.todayspick;
  final response = await http.get(todayspickUrl,
      headers: {"Authorization": "Bearer" + prefs.getString('spToken')});
  // print(response.body);
  if (json.decode(response.body)['status_code'] == 200) {
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return (jsonResponse['data'] as List)
        .map((data) => Product.fromJson(data))
        .toList();
  }
}

Future<List<Product>> getProductOutlet1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final outlet1url = uri.baseurl + uri.getProduct1;
  final response = await http.get(outlet1url,
      headers: {"Authorization": "Bearer" + prefs.getString('spToken')});

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return (jsonResponse['data'] as List)
        .map((data) => Product.fromJson(data))
        .toList();
    // globalProduct = (jsonResponse['data'] as List).map((data) => Product.fromJson(data)).toList();

    // await saveProductModel(json.decode(response.body));

    // print(jsonResponse);
  } else {
    // print(response.statusCode);
    // print(response.body);
  }
}

Future checkPhoneNumber({BuildContext context,String phoneNumber}) async {
  final phoneNumberCheckUrl = uri.baseurl + uri.checkPhoneNumber;

  Map<String, String> body = {'phone': '+62'+phoneNumber};

  final response = await http.post(phoneNumberCheckUrl, body:body );
  print(response.body);
  if (response.statusCode == 401) {
    print('yoot');
    // return true;
  } else {
    // print('oyoy');
    throw 'Nomor telepon sudah digunakan, silakan gunakan nomor telepon lain';
    
  }
}

Future checkEmail({BuildContext context,String username,String password,String email, String phone, String fullname}) async {
  final emailCheckUrl = uri.baseurl + uri.checkEmail + '?email=$email';
  final response = await http.get(emailCheckUrl);
  

  if (response.statusCode == 200) {
    Navigator.pop(context);
    // print('dari cek email');
    throw new Exception('Email sudah digunakan, silakan gunakan email lain');
    // new Exception(json.decode(response.body)['status']);
    
  } else {
    Navigator.pop(context);
    await registerWithGmail(context, username, password, email, phone, fullname);
    
  }
}

//Bayar Gopay
Future<void> buatTransaksi({
  BuildContext context,
  String paymentType,
  // List<Item> items,
  List<Product> lmp,
  Detail transactionDetails,
  Gopay gopay,
}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final gopayUrl = uri.baseurl + uri.order;
  Map<String, String> header = {
    'Authorization': 'Bearer' + prefs.getString('spToken')
  };
  DateTime dateTime = DateTime.now();
  var url = Uri.parse(gopayUrl);
  var request = http.MultipartRequest("POST", url);

  request.headers.addAll(header);
  request.fields['outlet_id'] = '1';
  request.fields['promo_id'] = '0';
  request.fields['total_final_price'] =
      transactionDetails.grossAmount.toString();
  request.fields['total_base_price'] = '10000';
  request.fields['pickup_time'] = dateTime.toString();
  request.fields['payment_type'] = paymentType;
  request.fields['payment_gateway'] =
      (paymentType == 'ovo') ? 'xendit' : 'midtrans';
  for (int i = 0; i < lmp.length; i++) {
    request.fields['product_id[$i]'] = lmp[i].id.toString();
    request.fields['qty[$i]'] = lmp[i].quantity.toString();
    request.fields['base_price[$i]'] = lmp[i].base_price.toString();
    request.fields['final_price[$i]'] = lmp[i].price.toString();
    request.fields['message[$i]'] = 'pesan dari Om';
  }
  // Map<String, dynamic> body = {
  //   'outlet_id': '1',
  //   'promo_id': '0',
  //   'payment_type': paymentType,
  //   'payment_gateway': (paymentType == 'ovo')?'xendit':'midtrans',
  //   'transaction_details': {
  //     'order_id': 'Ilham123_senja_' + dateTime.toString(),
  //     'gross_amount': transactionDetails.grossAmount
  //   },
  //   'item_details': lmp,
  // };
  // print(body);
  // print('ini jsonnya : ');
  // print(json.encode(body));

  // final response =
  //     await http.post(gopayUrl, headers: header, body: json.encode(body));

  var response = await request.send();
  final responseInString = await response.stream.bytesToString();

  if (response.statusCode == '201') {
    print('sukses');
    // launch(json.decode(response.body)['actions'][1]['url']);
  } else {
    print(responseInString);
  }
}
