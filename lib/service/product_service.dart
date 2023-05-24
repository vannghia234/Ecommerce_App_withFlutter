import 'dart:convert';

import 'package:ecommerce_app/api/products/fetch_api.dart';
import 'package:logger/logger.dart';

import '../models/productmodel.dart';

class ProductService {
  static Future<List<ProductModel>> getAll() async {
    try {
      final response = await FetchApiProductService.instance.getAllProduct();
      final productList = <ProductModel>[];
      if (response != null && response.data != null) {
        for (var productData in response.data!) {
          productList.add(productData as ProductModel);
        }
      }
      Logger().i(jsonEncode(productList));
      return productList;
    } catch (error) {
      print('Error fetching products: $error');
      return [];
    }
  }
}
