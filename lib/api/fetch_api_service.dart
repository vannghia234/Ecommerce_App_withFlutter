import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:http/http.dart' as http;

class FetchApiService {
  //singleTon Partern
  static final FetchApiService _instance = FetchApiService._internal();
  factory FetchApiService() {
    return _instance;
  }
  FetchApiService._internal();

  // code here
  Future<void> getRefreshToken() async {
    var url = Uri.parse(ApiUrl.baseUrl);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
    }
  }
}
