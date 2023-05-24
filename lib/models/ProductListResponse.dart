class ProductListResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<Data>? data;

  ProductListResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
    apiVersion = json['apiVersion'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['timestamp'] = timestamp;
    data['apiVersion'] = apiVersion;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  dynamic rating;
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
    productId = json['productId'];
    productName = json['productName'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    unit = json['unit'];
    urlImageThumb = json['urlImageThumb'];
    descriptionImageLists = json['descriptionImageLists'];
    quantityStock = json['quantityStock'];
    createdDate = json['createdDate'];
    updatedDay = json['updatedDay'];
    rating = json['rating'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    provider =
        json['provider'] != null ? Provider.fromJson(json['provider']) : null;
    productType = json['productType'] != null
        ? ProductType.fromJson(json['productType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['description'] = description;
    data['price'] = price;
    data['status'] = status;
    data['unit'] = unit;
    data['urlImageThumb'] = urlImageThumb;
    data['descriptionImageLists'] = descriptionImageLists;
    data['quantityStock'] = quantityStock;
    data['createdDate'] = createdDate;
    data['updatedDay'] = updatedDay;
    data['rating'] = rating;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    if (productType != null) {
      data['productType'] = productType!.toJson();
    }
    return data;
  }
}

class Category {
  String? categoryId;
  String? categoryName;

  Category({this.categoryId, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    return data;
  }
}

class Provider {
  String? id;
  String? name;

  Provider({this.id, this.name});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProductType {
  String? productTypeId;
  String? productTypeName;

  ProductType({this.productTypeId, this.productTypeName});

  ProductType.fromJson(Map<String, dynamic> json) {
    productTypeId = json['productTypeId'];
    productTypeName = json['productTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productTypeId'] = productTypeId;
    data['productTypeName'] = productTypeName;
    return data;
  }
}
