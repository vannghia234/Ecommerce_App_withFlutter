import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../constant.dart';

class FetchApiOrderDetailService {
  final logger = Logger();

  //singleTon Partern
  static final FetchApiOrderDetailService instance =
      FetchApiOrderDetailService._internal();
  factory FetchApiOrderDetailService() {
    return instance;
  }
  FetchApiOrderDetailService._internal();

  // code here
  Future<OrderDetailResponse?> getOrderDetailByOrderId(String orderId) async {
    var url = Uri.parse('${ApiUrl.apiGetOrderDetailByOrderId}$orderId');
    try {
      final response = await http.get(url, headers: header);

      var detail = OrderDetailResponse.fromJson(jsonDecode(response.body));
      logger.i('response: ${detail.data?[0].id}');

      return detail;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
