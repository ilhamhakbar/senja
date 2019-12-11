class Transaksi {
  String paymentType;
  Detail transactionDetails;
  List<Item> itemDetails;
  Gopay gopay;

  Transaksi({this.paymentType,this.itemDetails, this.transactionDetails, this.gopay});

  // factory Transaksi.fromMap(Map<String, dynamic> json) => new Transaksi(
  //       paymentType: json["payment_type"] == null ? null : json["payment_type"],
  //       itemDetails: (json.["item_details"] as List).map((i) => Items.fromJson(i)).toList(),
  //       transactionDetails: json["transaction_details"] == null
  //           ? null
  //           : Details.fromMap(json["transaction_details"]),
  //       gopay: json["gopay"] == null ? null : Gopay.fromMap(json["gopay"]),
  //     );

  // Map<String, dynamic> toMap() => {
  //       "payment_type": paymentType == null ? null : paymentType,
  //       "transaction_details":
  //           transactionDetails == null ? null : transactionDetails.toMap(),
  //       "gopay": gopay == null ? null : gopay.toMap(),
  //     };
}
class Item{
  int id;
  String name;
  int quantity;
  int price;
  Item({this.id, this.name, this.quantity, this.price});

   Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "quantity": quantity == null? null : quantity,
        "price": price == null? null : price
      };
}

class Detail {
  String orderId;
  int grossAmount;

  Detail({this.orderId, this.grossAmount});

  factory Detail.fromMap(Map<String, dynamic> json) => new Detail(
        orderId: json["order_id"] == null ? null : json["order_id"],
        grossAmount: json["gross_amount"] == null ? null : json["gross_amount"],
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId == null ? null : orderId,
        "gross_amount": grossAmount == null ? null : grossAmount,
      };
}

class Gopay {
  String enableCallback;
  String callbackUrl;

  Gopay({this.enableCallback, this.callbackUrl});

  factory Gopay.fromMap(Map<String, dynamic> json) => new Gopay(
        enableCallback:
            json["enable_callback"] == null ? null : json["enable_callback"],
        callbackUrl: json["callback_url"] == null ? null : json["callback_url"],
      );

  Map<String, dynamic> toMap() => {
        "enable_callback": enableCallback == null ? null : enableCallback,
        "callback_url": callbackUrl == null ? null : callbackUrl,
      };
}
