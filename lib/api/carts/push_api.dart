import 'dart:convert';

import 'package:logger/logger.dart';

import '../../models/create_cart_response.dart';
import '../api_url.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class PushApiCartService {
  static final PushApiCartService instance = PushApiCartService._internal();
  factory PushApiCartService() {
    return instance;
  }
  PushApiCartService._internal();

  Future addToCart({required String productId, String quantity = "1"}) async {
    var url = Uri.parse(ApiUrl.apiPostAddtoCart);
    final body = {
      "products": [
        {"productId": productId, "quantity": quantity}
      ]
    };

    try {
      var response =
          await http.post(url, body: jsonEncode(body), headers: header);

      final result = CreateCartResponse.fromJson(jsonDecode(response.body));
      Logger().i('STATUS ADD CART: ${response.statusCode} ');
      Logger().i('MESS ADD CART: ${result.message} ');

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
