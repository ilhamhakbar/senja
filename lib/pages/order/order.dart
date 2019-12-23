import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/card/bestseller_view.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/product.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/card/category_list_view.dart';
import 'package:senja/services/api_services.dart';


class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Product> products = [];
  bool isLoading = false;
  @override
  void initState(){
  }




  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
    return ListView(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.all(16),
        //   child: Text(
        //     'Your favourites',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18,
        //       fontFamily: 'Lato',
        //     ),
        //   ),
        // ),
        // MenuListView(true),
        // Divider(),
          Container(
          padding: EdgeInsets.all(16),
          child: Text(
            'Best Seller',
            style: h4 ,
          ),
        ),
        BestSellerListView(false),
        Divider(),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                child:  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
            itemCount: model.categoryList.length,
            shrinkWrap: true,
            itemBuilder: (context, i){
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                       padding: EdgeInsets.all(16),
                      child: Text(model.categoryList[i]  ,style: h4,),
                    ),
                    Container(
                      child:  CategoryListView(isVertical: false,categoryList: model.categoryList[i],),
                    )
                  ],
                ),
              );
            },
          ),
              )
            ],
          ),
        ),
      
      ],
    );
  });}
}