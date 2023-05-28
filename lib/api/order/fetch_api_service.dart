import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/models/order_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../constant.dart';

class FetchApiOrderService {
  //singleTon Partern
  static final FetchApiOrderService instance = FetchApiOrderService._internal();
  factory FetchApiOrderService() {
    return instance;
  }
  FetchApiOrderService._internal();
  // code here
  Future<OrderResponse?> getOrderByUserId(String id) async {
    var url = Uri.parse('${ApiUrl.apiGetOrderByUserId}$id');
    try {
      final response = await http.get(url, headers: header);

      var order = OrderResponse.fromJson(jsonDecode(response.body));
      Logger().i('response: ${order.id}');

      return order;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<OrderResponse?> createOrder(
      String id, String paymentMethod, List<ProductOrder> list) async {
    final body = <String, dynamic>{
      "userId": id,
      "paymentMethodId": paymentMethod,
      "products": [
        for (var i = 0; i < list.length; i++)
          {
            {
              "productId": list[i].productId,
              "quantity": list[i].quantity,
            }
          }
      ]
    };
    var url = Uri.parse(ApiUrl.apiCreateOrder);
    try {
      final response =
          await http.post(url, headers: header, body: jsonEncode(body));

      var order = OrderResponse.fromJson(jsonDecode(response.body));
      //logger.i('response: ${order.data?[0].id}');

      return order;
    } catch (e) {
      throw Exception(e);
    }
  }
}
