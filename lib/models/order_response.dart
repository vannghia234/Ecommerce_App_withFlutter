class OrderResponse {
  String? id;
  String? orderDate;
  String? deliveryDate;
  String? status;
  int? discount;
  int? totalPrice;
  PaymentMethod? paymentMethod;
  User? user;

  OrderResponse(
      {this.id,
      this.orderDate,
      this.deliveryDate,
      this.status,
      this.discount,
      this.totalPrice,
      this.paymentMethod,
      this.user});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderDate = json["order_date"];
    deliveryDate = json["delivery_date"];
    status = json["status"];
    discount = json["discount"];
    totalPrice = json["totalPrice"];
    paymentMethod = json["paymentMethod"] == null
        ? null
        : PaymentMethod.fromJson(json["paymentMethod"]);
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["order_date"] = orderDate;
    data["delivery_date"] = deliveryDate;
    data["status"] = status;
    data["discount"] = discount;
    data["totalPrice"] = totalPrice;
    if (paymentMethod != null) {
      data["paymentMethod"] = paymentMethod?.toJson();
    }
    if (user != null) {
      data["user"] = user?.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? phone;
  dynamic avatarUrl;
  List<Addresses>? addresses;
  Permission? permission;

  User(
      {this.id,
      this.fullname,
      this.email,
      this.username,
      this.phone,
      this.avatarUrl,
      this.addresses,
      this.permission});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    username = json["username"];
    phone = json["phone"];
    avatarUrl = json["avatarUrl"];
    addresses = json["addresses"] == null
        ? null
        : (json["addresses"] as List)
            .map((e) => Addresses.fromJson(e))
            .toList();
    permission = json["permission"] == null
        ? null
        : Permission.fromJson(json["permission"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["fullname"] = fullname;
    data["email"] = email;
    data["username"] = username;
    data["phone"] = phone;
    data["avatarUrl"] = avatarUrl;
    if (addresses != null) {
      data["addresses"] = addresses?.map((e) => e.toJson()).toList();
    }
    if (permission != null) {
      data["permission"] = permission?.toJson();
    }
    return data;
  }
}

class Permission {
  String? id;
  String? name;
  bool? isAvailable;

  Permission({this.id, this.name, this.isAvailable});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    isAvailable = json["isAvailable"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["isAvailable"] = isAvailable;
    return data;
  }
}

class Addresses {
  String? id;
  String? address;
  String? location;

  Addresses({this.id, this.address, this.location});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    address = json["address"];
    location = json["location"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["address"] = address;
    data["location"] = location;
    return data;
  }
}

class PaymentMethod {
  String? id;
  String? name;

  PaymentMethod({this.id, this.name});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
