import 'package:ecommerce_app/screens/splash/splash_screen.dart';

class UserModel {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? phone;
  dynamic avatarUrl;

  UserModel({
    this.id,
    this.fullname,
    this.email,
    this.username,
    this.phone,
    this.avatarUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["fullname"] is String) {
      fullname = json["fullname"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["username"] is String) {
      username = json["username"];
    }

    if (json["phone"] is String) {
      phone = json["phone"];
    }
    avatarUrl = json["avatarUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["fullname"] = fullname;
    data["email"] = email;
    data["username"] = username;
    data["phone"] = phone;
    data["avatarUrl"] = avatarUrl;

    return data;
  }
}

class ChatModel {
  String? id;
  String? message;
  User? userSend;
  User? userReceive;
  String? time;

  ChatModel({this.id, this.message, this.userReceive, this.userSend});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["userSend"] is User) {
      userSend = json["userSend"];
    }
    if (json["userReceive"] is User) {
      userReceive = json["userReceive"];
    }

    if (json["time"] is String) {
      time = json["time"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["message"] = message;
    data["userSend"] = userSend;
    data["userReceive"] = userReceive;
    data["time"] = time;
    return data;
  }
}
