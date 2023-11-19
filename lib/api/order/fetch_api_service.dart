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
      Logger().i('Url: $url');

      Logger().i('response: ${order.id}');

      return order;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future createReview(
      {String? comment,
      int rating = 5,
      required String userId,
      required String productId,
      required orderId}) async {
    final body = {
      "comment": comment ?? "",
      "rating": rating,
      "userId": userId,
      "productId": productId,
      "orderId": orderId
    };
    Logger().i(body);
    var url = Uri.parse(ApiUrl.apiPostReview);
    try {
      final response =
          await http.post(url, headers: header, body: jsonEncode(body));
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<OrderResponse?> createOrder(
      String id, String paymentMethod, List<ProductOrder> list) async {
    final body = <String, dynamic>{
      "userId": id,
      "paymentMethodId": paymentMethod,
      "products": List.generate(list.length, (index) {
        return {
          "productId": list[index].productId,
          "quantity": list[index].quantity
        };
      })
    };
    Logger().i(body);
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

  Future<OrderResponse?> updateStatusOrder(
      String orderId, String status) async {
    var url = Uri.parse(ApiUrl.apiUpdateStatusOrder);

    final body = <String, String>{"orderId": orderId, "status": status};

    try {
      var response = await http.put(url, body: jsonEncode(body));
      final result = OrderResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
