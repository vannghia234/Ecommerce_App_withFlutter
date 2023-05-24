// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class LoginAccountInfoController extends GetxController {
  // lưu trữ thông tin account
  final _accessToken = "".obs;
  final _refreshToken = "".obs;
  User? user;

  get accessToken => _accessToken;

  set accessToken(final value) => _accessToken.value = value;

  get refreshToken => _refreshToken;

  set refreshToken(value) => _refreshToken.value = value;

  get getUser => user;

  set setUser(user) => this.user = user;
}

class User {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? phone;
  dynamic avatarUrl;

  User({
    this.id,
    this.fullname,
    this.email,
    this.username,
    this.phone,
    this.avatarUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
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
