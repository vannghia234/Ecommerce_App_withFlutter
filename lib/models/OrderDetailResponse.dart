class OrderDetailResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<Data>? data;

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
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["timestamp"] = timestamp;
    data["apiVersion"] = apiVersion;
    data["status"] = status;
    data["message"] = message;
    return data;
  }
}

class Data {
  String? id;
  int? quantity;
  int? pricePurchase;
  Product? product;

  Data({this.id, this.quantity, this.pricePurchase, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    quantity = json["quantity"];
    pricePurchase = json["pricePurchase"];
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
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

class Product {
  String? productId;
  String? productName;
  String? description;
  int? price;
  String? status;
  String? unit;
  String? urlImageThumb;
  String? descriptionImageLists;
  int? quantityStock;
  String? createdDate;
  String? updatedDay;

  Product(
      {this.productId,
      this.productName,
      this.description,
      this.price,
      this.status,
      this.unit,
      this.urlImageThumb,
      this.descriptionImageLists,
      this.quantityStock,
      this.createdDate,
      this.updatedDay});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json["productId"];
    productName = json["productName"];
    description = json["description"];
    price = json["price"];
    status = json["status"];
    unit = json["unit"];
    urlImageThumb = json["urlImageThumb"];
    descriptionImageLists = json["descriptionImageLists"];
    quantityStock = json["quantityStock"];
    createdDate = json["createdDate"];
    updatedDay = json["updatedDay"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["productId"] = productId;
    data["productName"] = productName;
    data["description"] = description;
    data["price"] = price;
    data["status"] = status;
    data["unit"] = unit;
    data["urlImageThumb"] = urlImageThumb;
    data["descriptionImageLists"] = descriptionImageLists;
    data["quantityStock"] = quantityStock;
    data["createdDate"] = createdDate;
    data["updatedDay"] = updatedDay;
    return data;
  }
}
