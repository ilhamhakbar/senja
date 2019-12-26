import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/models/product.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/card/card_widget/coffee_card.dart';

class CoffeeListView extends StatefulWidget {
  final bool isVertical;
  CoffeeListView(this.isVertical);
  @override
  State<StatefulWidget> createState() {
    return CoffeeListViewState();
  }
}

class CoffeeListViewState extends State<CoffeeListView> {

  bool showminus = false;
  
  Widget _buildCoffeeItems(BuildContext context, int position, Product product,
      ProductsModel model) {
    return CoffeeCard(model: model,product: product,);
    // _buildCoffeeCard(context, product, model);
  }

  Widget _buildCoffeeList(List<Product> products, ProductsModel model) {
    Widget productCard;
    if (products.length > 0) {
      productCard = Container(
        padding: EdgeInsets.only(left: 8, top: 0),
        height: 250,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              _buildCoffeeItems(context, index, products[index], model),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
        ),
      );
    } else {
      productCard = Center(child: Text("No Products Found!"));
    }
    return productCard;
  }

  Widget _buildCoffeeListVertical(List<Product> products, ProductsModel model) {
    Widget productCard;
    if (products.length > 0) {
      productCard = Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => _buildCoffeeItems(
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
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return widget.isVertical
            ? _buildCoffeeList(model.productsOutlet1, model)
            : _buildCoffeeListVertical(model.productsOutlet1, model);
      },
    );
  }

      // bool showminus = false;


  // Widget _buildBestSellerCard(
  //     BuildContext context, Product product, ProductsModel model) {

  //   void incrementCounterPlus(){
  //     if(product.quantity == 0){
  //     setState(() {
  //       showminus = true;
  //     });
  //   }
  //   }
  //   void incrementCounterMinus(){
  //     if(product.quantity == 0){
  //       setState(() {
  //         showminus = false;
  //       });
  //     }
  //   }
  //   return Container(
  //       child: Row(
  //     children: <Widget>[
  //       FlatButton(
  //         onPressed: () {},
  //         padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
  //         child: Container(
  //           width: sizeHorizontal*70,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: NetworkImage(product.image), fit: BoxFit.cover),
  //                     borderRadius: BorderRadius.all(Radius.circular(10))),
  //                 height: 75,
  //                 width: 75,
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(left: 20.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Container(
  //                         alignment: Alignment.topLeft,
  //                         child: Text(product.title, style: h4)),
  //                     Container(
  //                       width: sizeHorizontal * 45,
  //                       padding: EdgeInsets.only(top: 10.0),
  //                       child: Text(
  //                         product.description,
  //                         style: TextStyle(color: Colors.grey),
  //                       ),
  //                     ),
  //                     Container(
  //                         padding: EdgeInsets.only(top: 10.0),
  //                         child: Text(
  //                           'Rp ' + product.price.toString(),
  //                           style: TextStyle(color: Colors.black),
  //                         )),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Container(
  //         padding: EdgeInsets.only(left: 10.0, bottom: 40.0),
  //         child: Column(
  //           children: <Widget>[
  //             Container(
  //               // width: 75,
  //               child: Row(
  //                 children: <Widget>[
  //                   (showminus)
  //                   ?
  //                   // (buttonMinus)
  //                   Container(
  //                     width: 90,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: <Widget>[
  //                         InkWell(
  //                           onTap: () {
  //                             model.removeFromCart(product);
  //                             incrementCounterMinus();
  //                           },
  //                           child: Container(
  //                             alignment: Alignment.center,
  //                             decoration: BoxDecoration(
  //                                 color: Colors.redAccent,
  //                                 shape: BoxShape.circle),
  //                             width: 25.0,
  //                             height: 25.0,
  //                             child: Icon(Icons.remove,
  //                                 size: 15, color: Colors.white),
  //                           ),
  //                         ),
  //                         Container(
  //                           decoration: BoxDecoration(
  //                               border: Border(
  //                                   bottom: BorderSide(
  //                                       color: Colors.black, width: 3.0))),
  //                           padding: EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 0),
  //                           width: 30.0,
  //                           height: 30.0,
  //                           child: Text(
  //                             product.quantity.toString(),
  //                             style: h4,
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         ),
  //                         InkWell(
  //                           onTap: () {
  //                             model.addToCart(product);
  //                             incrementCounterPlus();
  //                           },
  //                           child: Container(
  //                             alignment: Alignment.center,
  //                             decoration: BoxDecoration(
  //                                 color: Colors.greenAccent,
  //                                 shape: BoxShape.circle),
  //                             width: 25.0,
  //                             height: 25.0,
  //                             child: Icon(Icons.add,
  //                                 size: 15, color: Colors.white),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ): Container(
  //                     child: Row(
  //                       children: <Widget>[
  //                           Container(
  //                           padding: EdgeInsets.only(left: 15.0, top: 2.5),
  //                       width: 40.0,
  //                       height: 30.0,
  //                         ),
  //                         InkWell(
  //                           onTap: (){
  //                             model.addToCart(product);
  //                             showminus = true;
  //                           },
  //                           child: Container(
  //                             alignment: Alignment.center,
  //                             decoration: BoxDecoration(
  //                                 color: Colors.greenAccent,
  //                                 shape: BoxShape.circle),
  //                             width: 25.0,
  //                             height: 25.0,
  //                             child: Icon(Icons.add,
  //                                 size: 15, color: Colors.white),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ));
  // }
}
