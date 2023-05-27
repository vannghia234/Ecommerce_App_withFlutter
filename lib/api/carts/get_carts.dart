import 'dart:convert';

import 'package:ecommerce_app/models/cart_product_response.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../api_url.dart';
import '../constant.dart';

class FetchApiCartService {
  static Future<CartProductResponse> getCart(String? userId) async {
    Logger().i("api getCart");

    var url = Uri.parse(ApiUrl.apiGetCart + userId!);
    Logger().i(url);

    try {
      // lộn get mới đúng
      var response = await http.get(url, headers: header);

      final result = CartProductResponse.fromJson(jsonDecode(response.body));

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
