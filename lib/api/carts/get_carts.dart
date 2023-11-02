import 'dart:convert';

import 'package:ecommerce_app/models/cart_product_response.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../api_url.dart';
import '../constant.dart';

class FetchApiCartService {
  static Future<CartProductResponse> getCart(String? userId) async {
    var url = Uri.parse(ApiUrl.apiGetCart + userId!);
    Logger().i(url);
    try {
      var response = await http.get(url, headers: header);
      final result = CartProductResponse.fromJson(jsonDecode(response.body));
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<CartProductResponse> deleteCart(
      String userId, String productId) async {
    var url = Uri.parse(ApiUrl.apiDeleteCart);
    final body = <String, dynamic>{
      "userId": userId,
      "products": [
        {"productId": productId, "quantity": "1"}
      ]
    };
    try {
      var response =
          await http.delete(url, headers: header, body: jsonEncode(body));

      final result = CartProductResponse.fromJson(jsonDecode(response.body));

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
