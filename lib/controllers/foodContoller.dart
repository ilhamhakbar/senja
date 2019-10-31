import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:senja/models/foodModel.dart';


Future<FoodMenu> getFoodMenu() async {
  final response = await http.get('http://media.sipaud.id/jsonmock/senjaapp/home/001');
  if(response.statusCode == 200){
    return FoodMenu.fromJson(json.decode(response.body));
  }else{
    throw 'Failed';
  }
}