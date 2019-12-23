import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/services/api_services.dart';
import 'package:senja/models/transaksi.dart';

class WaitingGopay extends StatefulWidget {
  final String amount;
  final String gopaytoken;
  final String transactionID;
  final String orderId;

  const WaitingGopay(
      {Key key, this.amount, this.gopaytoken, this.transactionID, this.orderId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WaitingGopayState();
  }
}

class _WaitingGopayState extends State<WaitingGopay> {
  Map<String, dynamic> paymentData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTransactionDetail();
  }

  apa(){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      child:
      return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () {
            buatTransaksi(lmp: model.mapItems,context: context, transactionDetails: Detail(orderId: widget.orderId,grossAmount: model.getCartPrice));
            print(model.getCartPrice.toString());
          },
          child: Container(
              height: 50,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Text(
                  'PAY WITH GO-PAY',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 380,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top:25.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios))),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'JUMLAH YANG HARUS DIBAYARKAN',
                        style: TextStyle(fontSize: 20, color: Colors.black45),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Rp. ' + model.getCartPrice.toString(),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Eventevent will automatically check your payment. It may take up to 1 hour to process',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  // Future getTransactionDetail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   var session;

  //   setState(() {
  //     session = prefs.getString('Session');
  //   });

  //   String url = BaseApi().apiUrl +
  //       '/ticket_transaction/detail?transID=${widget.transactionID}&X-API-KEY=${API_KEY}';
  //   final response = await http.get(url,
  //       headers: {'Authorization': AUTHORIZATION_KEY, 'cookie': session});

  //   print(response.body);
  //   print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     var extractedData = json.decode(response.body);
  //     setState(() {
  //       paymentData = extractedData['data'];
  //       startCounter(paymentData['expired_time']);
  //       print(paymentData);
  //     });
  //   }
  // }

  // gopaySetup(){
  //   final flutrans = Flutrans();
  //   MidtransTransaction transaction;
  //   flutrans.init(CLINET_ID, 'https://home.eventeventapp.com/webhook.midtrans');
  //   flutrans.setFinishCallback(
  //     (TransactionFinished){
  //       //here
  //     }
  //   );
  //   ///flutrans.makePayment(transaction.)
  // }
}
