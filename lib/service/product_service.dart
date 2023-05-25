import 'package:ecommerce_app/api/products/fetch_api.dart';
import 'package:ecommerce_app/models/product_list_response.dart';

import '../models/product_category_response.dart';
import '../models/product_response.dart';

class ProductService {
  static Future<ProductListResponse?> getAllProduct() async {
    return FetchApiProductService.instance.getAllProduct();
  }

  static Future<ProductResponse?> getProductByName(String name) async {
    return FetchApiProductService.instance.getProductByName(name);
  }

  static Future<ProductResponse?> getProductById(String id) async {
    return FetchApiProductService.instance.getProductById(id);
  }

  static Future<ProductByCategoryResponse?> getProductByCategory(
      String cate) async {
    return FetchApiProductService.instance.getProductByCategory(cate);
  }
}
