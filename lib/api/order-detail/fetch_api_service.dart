import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/models/OrderDetailResponse.dart';
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
  Future<OrderDetailResponse?> getOrderDetailByOrderId(String id) async {
    var url = Uri.parse(ApiUrl.apiGetOrderDetail + id);
    try {
      final response = await http.get(url, headers: header);

      var detail = OrderDetailResponse.fromJson(jsonDecode(response.body));
      logger.i('response: ${detail.data?[0].id}');

      return detail;
    } catch (e) {
      throw Exception(e);
    }
  }
}
