import '../controller/get_cart_user_controller.dart';

class CartProductResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<ProductCart>? data;

  CartProductResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  CartProductResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"];
    apiVersion = json["apiVersion"];
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => ProductCart.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    if (data != null) {
      data1["data"] = data?.map((e) => e.toJson()).toList();
    }
    return data1;
  }
}

class Products {
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
  int? rating;

  Products(
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
      this.updatedDay,
      this.rating});

  Products.fromJson(Map<String, dynamic> json) {
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
    rating = json["rating"];
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
    data["rating"] = rating;
    return data;
  }
}

List<ProductCart> chooseProduct = <ProductCart>[];
