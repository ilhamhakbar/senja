import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/hotel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/models/product.dart';
import 'package:senja/scoped-model/products_model.dart';

class MenuListView extends StatelessWidget{
  final bool isVertical;
  MenuListView(this.isVertical);
  
  Widget _buildMenuItems(
    BuildContext context, int position, Product product, ProductsModel model
  ){
    return _buildMenuCard(context, product, model);
  }
  Widget _buildMenuList(List<Product> products, ProductsModel model){
    Widget productCard;
    if (products.length > 0){
      productCard = Container(
         padding: EdgeInsets.only(left: 8, top: 0),
        height: 250,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => _buildMenuItems(context, index, products[index], model),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
        ),
      );
    } else {
      productCard = Center(child: Text("No Products Found!"));
    }
    return productCard;
  }

  Widget _buildMenuListVertical(List<Product> products, ProductsModel model) {
    Widget productCard;
    if (products.length > 0) {
      productCard = Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => _buildMenuItems(
                context,
                index,
                products[index],
                model,
              ),
          // scrollDirection: isVertical? Axis.horizontal : Axis.vertical,
          itemCount: products.length,
        ),
      );
    } else {
      productCard = Center(child: Text('NO, PRODUCTS FOUND :( '));
    }
    return productCard;
  }
  
  @override
  Widget build(BuildContext context){
    return new ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model){
        return isVertical
            ? _buildMenuList(model.products, model)
            : _buildMenuListVertical(model.products, model);
      },
    );
  }

  Widget _buildMenuCard(
    BuildContext context, Product product, ProductsModel model){
    return Container(
          child: Row(
            children: <Widget>[
          FlatButton(
            onPressed: () {},
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 75,
                  width: 75,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(product.title, style: h4)),
                      Container(
                        width: sizeHorizontal*40,
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          product.description,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10.0),
                          // height: 100,
                          // width: 100,
                          // padding: EdgeInsets.only(left: 5.0, right: 5.0),d65a5a
                          // alignment: Alignment.bottomCenter,
                          child: Text('Rs. ${product.price}',
                            style: TextStyle(color: Colors.black),
                          )),
                                              ],
                  ),
                ),
                 Container(
                      alignment: Alignment.centerRight,
                      width: 70.0,
                                    height: 70.0,
                      child: FlatButton(
                        child: Text(
                          'ADD',
                          style: TextStyle(color: Colors.green),
                        ),
                        onPressed: () => model.addToCart(product),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 70.0,
                                    height: 70.0,
                      child: FlatButton(
                        child: Text(
                          'REMOVE',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () => model.removeFromCart(product),
                      ),
                    ),
              ],
          ),
        ),
            ],
          ));
}
}