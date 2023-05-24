import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/category_response.dart';
import '../api_url.dart';
import '../constant.dart';

class FetApiCategoryService {

  static final FetApiCategoryService instance =
      FetApiCategoryService._internal();

  factory FetApiCategoryService() {
    return instance;
  }

  FetApiCategoryService._internal();

  // code here
  Future<CategoryResponse?> getAllCategory() async {
    var url = Uri.parse(ApiUrl.apiGetAllCategory);
    try {
      final response = await http.get(url, headers: header);

      var category = CategoryResponse.fromJson(jsonDecode(response.body));

      return category;
    } catch (e) {
      throw Exception(e);
    }
  }
}
