import 'dart:convert';
import 'package:ecommerce_app/models/register_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../api_url.dart';
import '../constant.dart';

class ApiRegister {
  static Future<RegisterResponse> register(
      {required String fullname,
      required String email,
      required String username,
      required String password,
      required String phone,
      String permission = "a4a57c57-0951-4bf0-b0c1-666c2458c7f9"}) async {
    var url = Uri.parse(ApiUrl.apiRegister);
    final body = <String, String>{
      "fullname": fullname,
      "email": email,
      "username": username,
      "password": password,
      "phone": phone,
      "permissionId": permission
    };

    try {
      var response =
          await http.post(url, body: jsonEncode(body), headers: header);

      final result = RegisterResponse.fromJson(jsonDecode(response.body));
      Logger().d("api register");
      Logger().i(result.message);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
