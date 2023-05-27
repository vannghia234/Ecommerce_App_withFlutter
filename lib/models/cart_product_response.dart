import '../controller/get_cart_user_controller.dart';

class CartProductResponse {
    String? id;
    String? timestamp;
    String? apiVersion;
    String? status;
    String? message;
    List<ProductCart>? data;

    CartProductResponse({this.id, this.timestamp, this.apiVersion, this.status, this.message, this.data});

    CartProductResponse.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        timestamp = json["timestamp"];
        apiVersion = json["apiVersion"];
        status = json["status"];
        message = json["message"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => ProductCart.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["timestamp"] = timestamp;
        _data["apiVersion"] = apiVersion;
        _data["status"] = status;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
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

    Products({this.productId, this.productName, this.description, this.price, this.status, this.unit, this.urlImageThumb, this.descriptionImageLists, this.quantityStock, this.createdDate, this.updatedDay, this.rating});

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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["productId"] = productId;
        _data["productName"] = productName;
        _data["description"] = description;
        _data["price"] = price;
        _data["status"] = status;
        _data["unit"] = unit;
        _data["urlImageThumb"] = urlImageThumb;
        _data["descriptionImageLists"] = descriptionImageLists;
        _data["quantityStock"] = quantityStock;
        _data["createdDate"] = createdDate;
        _data["updatedDay"] = updatedDay;
        _data["rating"] = rating;
        return _data;
    }
}