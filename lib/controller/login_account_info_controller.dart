// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class LoginAccountInfoController extends GetxController {
  @override
  void onInit() {
    getAccessToken();
    super.onInit();
  }

  // lưu trữ thông tin account
  var _accessToken = "";
  var _refreshToken = "";
  User? user;
  final box = GetStorage();

  get accessToken => _accessToken;

  set accessToken(final value) => _accessToken = value;

  get refreshToken => _refreshToken;

  set refreshToken(value) => _refreshToken = value;

  get getUser => user;

  set setUser(user) => this.user = user;

  Future<void> saveAccessToken() async {
    await box.write('accessToken', accessToken);
    await box.write('refreshToken', refreshToken);
  }

  Future removeToken(String key) async {
    await box.remove(key);
  }

  Future getAccessToken() async {
    if (box.hasData('accessToken') && box.hasData('refreshToken')) {
      accessToken = box.read('accessToken');
      refreshToken = box.read('refreshToken');
      Logger().i('access token khi log get storage' + accessToken);
    }
  }
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
