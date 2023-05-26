import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/category_list_response.dart';
import '../api_url.dart';
import '../constant.dart';

class FetchApiCategoryService {
  static final FetchApiCategoryService instance =
      FetchApiCategoryService._internal();

  factory FetchApiCategoryService() {
    return instance;
  }

  FetchApiCategoryService._internal();

  // code here
  Future<CategoryListResponse?> getAllCategory() async {
    var url = Uri.parse(ApiUrl.apiGetAllCategory);
    try {
      final response = await http.get(url, headers: header);

      var category = CategoryListResponse.fromJson(jsonDecode(response.body));

      return category;
    } catch (e) {
      throw Exception(e);
    }
  }
}
