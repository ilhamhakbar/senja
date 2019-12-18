import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:senja/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
enum MenuLoadingState{
  none, loading, error
}

class MenuProvider with ChangeNotifier{
  MenuProvider(){
    getCategory();
  }

  MainMenu _mainMenu;
  MainMenu get mainMenu => _mainMenu;

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  MenuLoadingState _state = MenuLoadingState.none;
  MenuLoadingState get state => _state;

  _changeState(MenuLoadingState state){
    _state = state;
    notifyListeners();
  }

  getCategory() async {
    _changeState(MenuLoadingState.loading);
    try{
      final response = await http.get('http://media.sipaud.id/jsonmock/senjaapp/home/001').timeout(Duration(seconds: 5));
  if(response.statusCode == 200){
  //   _mainMenu = MainMenu.fromJson(json.decode(response.body));
    _changeState(MenuLoadingState.none);
  }else{
    _changeState(MenuLoadingState.error);
    throw 'Failed';
  }
    }catch (e){}
    on TimeoutException{
    getCategory();  
    }

  }

}

