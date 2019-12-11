import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/constants/theme.dart';
import 'package:senja/models/transaksi.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  Cart({Key key, @required this.product,}): super(key: key);
  Product product;
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart>{
  @override
  void initState(){
    super.initState();
  }
  
  // final Product product;
  // Cart(this.product);

  Widget _buildProductItems(BuildContext context, int position, Product product,
      ProductsModel model) {
    return _buildCartCard(context, product, model);
  }

  Widget _buildProductList(List<Product> products, ProductsModel model) {
    Widget productCard;
    if (products.length > 0) {
      productCard = SafeArea(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => _buildProductItems(
                context,
                index,
                products[index],
                model,
              ),
          itemCount: products.length,
        ),
      );
      // productCard = Center(child: Text(products.length.toString()));
    } else {
      productCard = Center(child: Text('YOUR CART IS EMPTY  :( '));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return _buildProductList(model.products, model);
      },
    );
  }

  Widget _buildCartCard(
    BuildContext context, Product product, ProductsModel model){
      return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: (product.quantity >0)?
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Container(
                       width: sizeHorizontal * 20,
                       height: 50,
                          padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Text(
                            product.quantity.toString()+" x ",
                            style: TextStyle(
                                fontSize: sizeHorizontal * 5,
                                fontFamily: "SFBold",
                                color: Colors.green),
                          ),
                        ),
                    Flexible(
                      child: Container(
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: sizeHorizontal * 60,
                              child: Text(
                                product.title,
                                style: TextStyle(
                                    fontSize: sizeHorizontal * 4.5,
                                        fontFamily: "SFBold"),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(top: 5.0),
                              child: Text("Rp " + product.price.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: sizeHorizontal * 4,
                                        fontFamily: "SFRegular",
                                        color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     Container(
                          // height: 50,
                          // padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: InkWell(
                                  onTap: () => model.removeFromCart(product),
                                  child: Container(
                                    // alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:Colors.redAccent,
                                      shape: BoxShape.circle
                                    ),
                                      width: 25,
                                      height: 25,                    
                                      child: Icon(Icons.remove, size: 20,color: Colors.white),
                                      ),
                                ),
                        ),
                  ],
                ),
                Divider()
              ],
            ):Container(),
          ),
        ],
      ),
    );
    }
}
