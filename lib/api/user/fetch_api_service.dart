import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/models/UserResponse.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FetchApiService {
  final logger = Logger();

  //singleTon Partern
  static final FetchApiService instance = FetchApiService._internal();
  factory FetchApiService() {
    return instance;
  }
  FetchApiService._internal();
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

  Future<UserResponse?> updateUser(String id) async {
    var url = Uri.parse(ApiUrl.apiUpdateUser + id);
    try {
      final response = await http.get(url, headers: header);

      var user = UserResponse.fromJson(jsonDecode(response.body));
      logger.i('response: ${user.data?.username}');

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
