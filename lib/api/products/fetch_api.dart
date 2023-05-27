import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../models/product_list_response.dart';
import '../../models/product_response.dart';
import '../constant.dart';

class FetchApiProductService {
  final logger = Logger();

  //singleTon Partern
  static final FetchApiProductService instance =
      FetchApiProductService._internal();
  factory FetchApiProductService() {
    return instance;
  }
  FetchApiProductService._internal();

  // code here
  Future<String?> getRefreshToken() async {
    var url = Uri.parse(ApiUrl.apiGetPublicKey);

    try {
      var response = await http.get(url, headers: header);

      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponse?> getAllProduct(
      String page, String pageSize) async {
    logger.d('get all product');
    var url =
        Uri.parse('${ApiUrl.apiGetAllProduct}?page=$page&pageSize=$pageSize');
    logger.i(url);

    try {
      final response = await http.get(url, headers: header);

      var product = ProductListResponse.fromJson(jsonDecode(response.body));

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductResponse?> getProductById(String id) async {
    var url = Uri.parse(ApiUrl.apiGetProductById + id);
    try {
      final response = await http.get(url, headers: header);

      var product = ProductResponse.fromJson(jsonDecode(response.body));

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponse?> getProductByName(String name) async {
    var url = Uri.parse(ApiUrl.apiGetProductByName + name);
    try {
      final response = await http.get(url, headers: header);

      var product = ProductListResponse.fromJson(jsonDecode(response.body));

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponse?> getAllProductByCategory(
      String category, String page, String pageSize) async {
    var url = Uri.parse(
        '${ApiUrl.apiGetProductbyCategory}$category?page=$page&pageSize=$pageSize');
    try {
      final response = await http.get(url, headers: header);

      var category = ProductListResponse.fromJson(jsonDecode(response.body));
      return category;
    } catch (e) {
      throw Exception(e);
    }
  }
}
