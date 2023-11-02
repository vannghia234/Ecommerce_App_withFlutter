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
    var url =
        Uri.parse('${ApiUrl.apiGetAllProduct}?page=$page&pageSize=$pageSize');
    logger.i(url);

    try {
      final response = await http.get(url, headers: header);

      var result = ProductListResponse.fromJson(jsonDecode(response.body));

      Logger().i('GET ALL PRODUCT: ${response.statusCode} ');
      Logger().i('MESS GET ALL PRODUCT: ${result.message} ');

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductResponse?> getProductById(String id) async {
    var url = Uri.parse(ApiUrl.apiGetProductById + id);
    try {
      final response = await http.get(url, headers: header);

      var result = ProductResponse.fromJson(jsonDecode(response.body));

      Logger().i('GET PRODUCT BY ID: ${response.statusCode} ');
      Logger().i('MESS PRODUCT BY ID: ${result.message} ');
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponse?> getProductByName(String name) async {
    var url = Uri.parse(ApiUrl.apiGetProductByName + name);
    try {
      final response = await http.get(url, headers: header);

      var product = ProductListResponse.fromJson(jsonDecode(response.body));

      Logger().i('GET PRODUCT BY NAME: ${response.statusCode} ');
      Logger().i('MESS PRODUCT BY NAME: ${product.message} ');

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

      Logger().i('GET ALL PRODUCT BY CATEGORY: ${response.statusCode} ');
      Logger().i('MESS GET ALL PRODUCT BY CATEGORY: ${category.message} ');

      return category;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductListResponse?> filterProduct(
      {required orderBy, String cateName = ''}) async {
    var url =
        Uri.parse('${ApiUrl.apiFilterProduct}$orderBy&category=$cateName');
    try {
      final response = await http.get(url, headers: header);

      var lists = ProductListResponse.fromJson(jsonDecode(response.body));
      Logger().i(url);
      Logger().i('FILTER PRODUCT STATUS CODE: ${response.statusCode} ');
      Logger().i('FILTER PRODUCT MESSAGE: ${lists.message} ');

      return lists;
    } catch (e) {
      throw Exception(e);
    }
  }
}
