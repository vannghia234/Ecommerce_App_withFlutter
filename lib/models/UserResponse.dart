class UserResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  Data? data;

  UserResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"];
    apiVersion = json["apiVersion"];
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    data1["data"] = data?.toJson();
    return data1;
  }
}

class Data {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? phone;
  dynamic avatarUrl;
  List<Addresses>? addresses;
  Permission? permission;

  Data(
      {this.id,
      this.fullname,
      this.email,
      this.username,
      this.phone,
      this.avatarUrl,
      this.addresses,
      this.permission});

  Data.fromJson(Map<String, dynamic> json) {
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

  Permission({this.id, this.name});

  Permission.fromJson(Map<String, dynamic> json) {
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

class Addresses {
  String? id;
  String? address;

  Addresses({this.id, this.address});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["address"] = address;
    return data;
  }
}
