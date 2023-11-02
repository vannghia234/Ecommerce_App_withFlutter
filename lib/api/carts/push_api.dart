import 'dart:convert';

import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:get/get.dart';
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
    final LoginAccountInfoController acc =
        Get.find<LoginAccountInfoController>();
    final body = {
      "products": [
        {"productId": productId, "quantity": quantity}
      ]
    };
    Logger().i('AUTH CART: ${headerAuthencication["Authorization"]} ');
    try {
      var response = await http.post(url,
          body: jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': acc.accessToken
          });

      final result = CreateCartResponse.fromJson(jsonDecode(response.body));
      Logger().i('STATUS ADD CART: ${response.statusCode} ');
      Logger().i('MESS ADD CART: ${result.message} ');

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
