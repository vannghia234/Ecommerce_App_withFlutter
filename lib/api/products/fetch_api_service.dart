import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../models/ProductListResponse.dart';
import '../../models/ProductResponse.dart';

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
  Future<String?> getRefreshToken() async {
    var url = Uri.parse(ApiUrl.apiGetPublicKey);

    try {
      var response = await http.get(url, headers: header);

      var jsonResponse = jsonDecode(response.body);
      logger.d(jsonResponse);
      return jsonResponse;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponse?> getAllProduct() async {
    var url = Uri.parse(ApiUrl.apiGetAllProduct);
    logger.d('api $url');
    try {
      final response = await http.get(url, headers: header);

      var product = ProductListResponse.fromJson(jsonDecode(response.body));

      logger.d('response: ${product.data?[0].productName}');

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductResponse?> getProductById(String id) async {
    var url = Uri.parse(ApiUrl.apiGetAllProduct + id);
    try {
      final response = await http.get(url, headers: header);

      var product = ProductResponse.fromJson(jsonDecode(response.body));

      return product;
    } catch (e) {
      print('lỗi $e');
      throw Exception(e);
    }
  }

  Future<ProductResponse?> getProductByName(String name) async {
    var url = Uri.parse(ApiUrl.apiGetAllProduct + name);
    try {
      final response = await http.get(url, headers: header);

      var product = ProductResponse.fromJson(jsonDecode(response.body));

      return product;
    } catch (e) {
      print('lỗi $e');
      throw Exception(e);
    }
  }
}
