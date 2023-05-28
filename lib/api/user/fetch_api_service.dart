import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/models/UserResponse.dart';
import 'package:ecommerce_app/models/change_pass_response.dart';
import 'package:ecommerce_app/models/update_user_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FetchApiUserService {
  final logger = Logger();

  //singleTon Partern
  static final FetchApiUserService instance = FetchApiUserService._internal();
  factory FetchApiUserService() {
    return instance;
  }
  FetchApiUserService._internal();
  final header = <String, String>{'Content-Type': 'application/json'};

  // code here
  Future<UserResponse?> getUserById(String id) async {
    var url = Uri.parse(ApiUrl.apiGetUser + id);
    logger.d('$url');
    try {
      final response = await http.get(url, headers: header);

      var user = UserResponse.fromJson(jsonDecode(response.body));
      logger.d('response: ${user.data?.username}');
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UpdateUserResponse?> updateUser(
      String userName, String fullname, String email, String phone) async {
    var url = Uri.parse(ApiUrl.apiUpdateUser);
    try {
      final response = await http.put(
        url,
        headers: header,
      );
      var user = UpdateUserResponse.fromJson(jsonDecode(response.body));

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ChangePassResponse> changePass(
      String userId, String oldPass, String newPass) async {
    var url = Uri.parse(ApiUrl.apiChangePassword);
    try {
      final response = await http.put(url,
          headers: header,
          body: jsonEncode(<String, String>{
            "userId": userId,
            "oldPass": oldPass,
            "newPass": newPass,
          }));
      var user = ChangePassResponse.fromJson(jsonDecode(response.body));
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
