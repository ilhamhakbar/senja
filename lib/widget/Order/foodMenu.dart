import 'package:flutter/material.dart';
import 'package:senja/models/storeMenuModel.dart';
import 'package:senja/constants/theme.dart';

typedef AddToCart();
typedef RemoveFromCart();

class FoodMenuCard extends StatefulWidget {
  final StoreItem foodCategory;
  final AddToCart addToCart;
  final RemoveFromCart removeFromCart;

  FoodMenuCard(
      {@required this.foodCategory,
      @required this.addToCart,
      @required this.removeFromCart,
      });
  int get jumlahPesanan => state.jumlahPesanan;
  // void addPesanan() => state.incrementCounterPlus();
  // void decreasePesanan() => state.incrementCounterMinus();
  final state = _FoodMenuCardState();
  @override
  _FoodMenuCardState createState() => state;
}

class _FoodMenuCardState extends State<FoodMenuCard> {
  int jumlahPesanan = 0;
  bool showminus = false; 

  @override
  Widget build(BuildContext context) {
    addToCart(StoreItem storeItem){
  };
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
                          image: NetworkImage(widget.foodCategory.image+'100/100'),
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
                          child: Text(widget.foodCategory.name, style: h4)),
                      Container(
                        width: sizeHorizontal*40,
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          widget.foodCategory.description,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10.0),
                          // height: 100,
                          // width: 100,
                          // padding: EdgeInsets.only(left: 5.0, right: 5.0),d65a5a
                          // alignment: Alignment.bottomCenter,
                          child: Text("Rp "+
                            widget.foodCategory.price.toString(),
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, bottom: 40.0),
            child: Column(
              children: <Widget>[
                Container(
                  // width: 75,
                  child: Row(
                    children: <Widget>[
                      (showminus)
                          ? Container(
                              width: 90,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    child: FloatingActionButton(
                                        backgroundColor: Color(0xffd65a5a),
                                        onPressed: incrementCounterMinus,
                                        child: Icon(Icons.remove, size: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0)))),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 15.0, top: 2.5),
                                    width: 40.0,
                                    height: 30.0,
                                    child: Text("$jumlahPesanan", style: h3),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    child: FloatingActionButton(
                                      backgroundColor: Color(0xff02c39a),
                                      onPressed: (){
                                        incrementCounterPlus;
                                        // addToCart(storeItem);
                                        },
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0))),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(child: Row(
                            children: <Widget>[
                              Container(
                              width: 25.0,
                              height: 25.0,
                              // child: FloatingActionButton(
                              //   backgroundColor: Color(0xffd65a5a),
                              //   onPressed: incrementCounterMinus,
                              //   child: Icon(Icons.remove, size: 15),
                              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0)))
                              // ),
                            ),
                      Container(
                        padding: EdgeInsets.only(left: 15.0, top: 2.5),
                        width: 40.0,
                        height: 30.0,
                        // child: Text("$jumlahPesanan", style:h3),
                      ),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        child: FloatingActionButton(
                          backgroundColor: Color(0xff02c39a),
                          onPressed: incrementCounterPlus,
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                        ),
                      ),
                            ],
                          ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void incrementCounterPlus() {  
     if(jumlahPesanan == 0){
      setState(() {
      showminus = true;
      });
        }
    widget.addToCart(); 
    setState(() {
      jumlahPesanan++;
    });   
    
  }

  void incrementCounterMinus() {
    
    if(jumlahPesanan == 0){
      setState(() {
       showminus = false; 
      });
    }
    widget.removeFromCart();
    setState(() {
      jumlahPesanan--;
    });
  }
}
