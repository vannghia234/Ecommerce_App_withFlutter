import 'package:ecommerce_app/service/product_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../api/category/fetch_api.dart';
import '../models/product_list_response.dart';

class ProductController extends GetxController {
  var _listAllProduct = <Product>[].obs;

  var listsearchProductByName = <Product>[].obs;

  final _listAllCategory = <Category>[].obs;

  final resultSearch = <Product>[].obs;

  RxList<Product> get listAllProduct => _listAllProduct;

  RxList<Category> get listAllCategory => _listAllCategory;

  get numOfList => _listAllProduct.length;

  set listAllProduct(value) => _listAllProduct = value;

  Future loadSearchResult(
      {required String category,
      String page = '1',
      String pageSize = '30'}) async {
    final res = await ProductService.instance
        .getProductByCategory(cate: category, page: page, pagesize: pageSize);

    resultSearch.value = res!.data!;
    // Logger().i("RESULT SEARCH: ${_listAllProduct[2].productName}");

    return;
  }

  Future loadListsCategory() async {
    final res = await FetchApiCategoryService.instance.getAllCategory();

    _listAllCategory.value = res!.data as List<Category>;

    return;
  }

  Future loadListsProduct() async {
    Logger().d("product controller");

    final res = await ProductService.instance.getAllProduct();
    Logger().d("product controller 1");

    _listAllProduct.value = res!.data!;

    Logger().i("getX total Load product: ${_listAllProduct.value.length}");
    return;
  }

  Future searchProductName(String name) async {
    final res = await ProductService.instance.getProductByName(name);

    listsearchProductByName.value = res!.data!;

    return;
  }
}