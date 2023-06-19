class CreateCartResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<Data>? data;

  CreateCartResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  CreateCartResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if (json["apiVersion"] is String) {
      apiVersion = json["apiVersion"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
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
  int? quantity;
  String? userId;
  int? discount;
  Products? products;

  Data({this.id, this.quantity, this.userId, this.discount, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["discount"] is int) {
      discount = json["discount"];
    }
    if (json["products"] is Map) {
      products =
          json["products"] == null ? null : Products.fromJson(json["products"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["quantity"] = quantity;
    data["userId"] = userId;
    data["discount"] = discount;
    if (products != null) {
      data["products"] = products?.toJson();
    }
    return data;
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
    if (json["productId"] is String) {
      productId = json["productId"];
    }
    if (json["productName"] is String) {
      productName = json["productName"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["unit"] is String) {
      unit = json["unit"];
    }
    if (json["urlImageThumb"] is String) {
      urlImageThumb = json["urlImageThumb"];
    }
    if (json["descriptionImageLists"] is String) {
      descriptionImageLists = json["descriptionImageLists"];
    }
    if (json["quantityStock"] is int) {
      quantityStock = json["quantityStock"];
    }
    if (json["createdDate"] is String) {
      createdDate = json["createdDate"];
    }
    if (json["updatedDay"] is String) {
      updatedDay = json["updatedDay"];
    }
    if (json["rating"] is int) {
      rating = json["rating"];
    }
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
