import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:senja/models/model.dart';


Future<MainMenu> getMainMenu() async {
  final response = await http.get('http://media.sipaud.id/jsonmock/senjaapp/home/001');
  if(response.statusCode == 200){
    return MainMenu.fromJson(json.decode(response.body));
  }else{
    throw 'Failed';
  }
}