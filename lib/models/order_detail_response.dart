import 'cart_product_response.dart';

class OrderDetailResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<OrderDetails>? data;

  OrderDetailResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  OrderDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"];
    apiVersion = json["apiVersion"];
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => OrderDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    data1["data"] = data?.map((e) => e.toJson()).toList();
    return data1;
  }
}

class OrderDetails {
  String? id;
  int? quantity;
  int? pricePurchase;
  Products? product;
  bool? isReviewed;

  OrderDetails(
      {this.id,
      this.quantity,
      this.pricePurchase,
      this.product,
      this.isReviewed});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    quantity = json["quantity"];
    pricePurchase = json["pricePurchase"];
    product =
        json["product"] == null ? null : Products.fromJson(json["product"]);
    isReviewed = json["isReviewed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["quantity"] = quantity;
    data["pricePurchase"] = pricePurchase;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    return data;
  }
}
