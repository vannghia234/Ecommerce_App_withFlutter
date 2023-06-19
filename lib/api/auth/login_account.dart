import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/api/constant.dart';
import 'package:ecommerce_app/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiLogin {
  static Future<LoginResponse> login(String username, String password) async {
    var url = Uri.parse(ApiUrl.apiLogin);

    final body = <String, String>{"username": username, "password": password};

    try {
      var response =
          await http.post(url, body: jsonEncode(body), headers: header);

      final result = LoginResponse.fromJson(jsonDecode(response.body));
      Logger().i('token ${result.data?.accessToken!}');
      Logger().i('STATUS ADD LOGIN: ${response.statusCode} ');
      Logger().i('MESS ADD LOGIN: ${result.message} ');

      return result;
    } catch (e) {
      Logger().i('catch $e');
      throw Exception(e);
    }
  }
}
