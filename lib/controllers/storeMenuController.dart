import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:senja/models/storeMenuModel.dart';


Future<StoreMenuList> getStoreMenu() async {
  final response = await http.get('http://media.sipaud.id/jsonmock/senjaapp/menu/002');
  if(response.statusCode == 200){
    return StoreMenuList.fromJson(json.decode(response.body));
  }else{
    throw 'Failed';
  }
}