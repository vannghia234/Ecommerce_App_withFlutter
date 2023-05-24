class OrderResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<Data>? data;

  OrderResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"];
    apiVersion = json["apiVersion"];
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
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

class Data {
  String? id;
  int? discount;
  String? status;
  int? totalPrice;
  String? orderDate;
  String? deliveryDate;

  Data(
      {this.id,
      this.discount,
      this.status,
      this.totalPrice,
      this.orderDate,
      this.deliveryDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    discount = json["discount"];
    status = json["status"];
    totalPrice = json["totalPrice"];
    orderDate = json["order_date"];
    deliveryDate = json["delivery_date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["discount"] = discount;
    data["status"] = status;
    data["totalPrice"] = totalPrice;
    data["order_date"] = orderDate;
    data["delivery_date"] = deliveryDate;
    return data;
  }
}
