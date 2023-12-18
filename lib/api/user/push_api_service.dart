import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/models/UserResponse.dart';
import 'package:ecommerce_app/models/change_pass_response.dart';
import 'package:ecommerce_app/models/update_user_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PushApiUserService {
  final logger = Logger();

  //singleTon Partern
  static final PushApiUserService instance = PushApiUserService._internal();
  factory PushApiUserService() {
    return instance;
  }
  PushApiUserService._internal();
  final header = <String, String>{'Content-Type': 'application/json'};

  // code here
  Future<UserResponse?> getUserByEmail(String email) async {
    var url = Uri.parse(ApiUrl.apiGetUserByEmail + email);
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

  Future<UserResponse?> updateUserNewPassord(
      String newPass, String userId) async {
    var url = Uri.parse(ApiUrl.apiPutUserPassword);
    logger.d('$url');
    var body = <String, String>{"userId": userId, "newPass": newPass};
    try {
      final response = await http.put(url, headers: header, body: jsonEncode(body));
      var user = UserResponse.fromJson(jsonDecode(response.body));
      logger.d('response: ${user.data?.username}');
      logger.d('response: ${user.status}');
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
