import 'package:ecommerce_app/api/products/fetch_api.dart';
import 'package:ecommerce_app/models/product_list_response.dart';

import '../models/product_response.dart';

class ProductService {
  static final ProductService instance = ProductService._internal();
  factory ProductService() {
    return instance;
  }
  ProductService._internal();

  Future<ProductListResponse?> getAllProduct() async {
    return FetchApiProductService.instance.getAllProduct();
  }

  Future<ProductResponse?> getProductByName(String name) async {
    return FetchApiProductService.instance.getProductByName(name);
  }

  Future<ProductResponse?> getProductById(String id) async {
    return FetchApiProductService.instance.getProductById(id);
  }

  Future<ProductListResponse?> getProductByCategory(String cate) async {
    return FetchApiProductService.instance.getAllProductByCategory(cate);
  }
}
