class ProductResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  Data? data;

  ProductResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
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
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    if (data != null) {
      data1["data"] = data?.toJson();
    }
    return data1;
  }
}

class Data {
  String? productId;
  String? productName;
  String? description;
  int? price;
  String? status;
  String? unit;
  dynamic urlImageThumb;
  dynamic descriptionImageLists;
  int? quantityStock;
  String? createdDate;
  String? updatedDay;
  int? rating;
  Category? category;
  Provider? provider;
  ProductType? productType;

  Data(
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
      this.rating,
      this.category,
      this.provider,
      this.productType});

  Data.fromJson(Map<String, dynamic> json) {
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
    urlImageThumb = json["urlImageThumb"];
    descriptionImageLists = json["descriptionImageLists"];
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
    if (json["category"] is Map) {
      category =
          json["category"] == null ? null : Category.fromJson(json["category"]);
    }
    if (json["provider"] is Map) {
      provider =
          json["provider"] == null ? null : Provider.fromJson(json["provider"]);
    }
    if (json["productType"] is Map) {
      productType = json["productType"] == null
          ? null
          : ProductType.fromJson(json["productType"]);
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
    if (category != null) {
      data["category"] = category?.toJson();
    }
    if (provider != null) {
      data["provider"] = provider?.toJson();
    }
    if (productType != null) {
      data["productType"] = productType?.toJson();
    }
    return data;
  }
}

class ProductType {
  String? productTypeId;
  String? productTypeName;

  ProductType({this.productTypeId, this.productTypeName});

  ProductType.fromJson(Map<String, dynamic> json) {
    if (json["productTypeId"] is String) {
      productTypeId = json["productTypeId"];
    }
    if (json["productTypeName"] is String) {
      productTypeName = json["productTypeName"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["productTypeId"] = productTypeId;
    data["productTypeName"] = productTypeName;
    return data;
  }
}

class Provider {
  String? id;
  String? name;

  Provider({this.id, this.name});

  Provider.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}

class Category {
  String? categoryId;
  String? categoryName;

  Category({this.categoryId, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    if (json["categoryId"] is String) {
      categoryId = json["categoryId"];
    }
    if (json["categoryName"] is String) {
      categoryName = json["categoryName"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["categoryId"] = categoryId;
    data["categoryName"] = categoryName;
    return data;
  }
}
