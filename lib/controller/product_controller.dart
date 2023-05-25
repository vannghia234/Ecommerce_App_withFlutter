import 'package:ecommerce_app/service/product_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../models/product_list_response.dart';

class ProductController extends GetxController {
  var _listAllProduct = <Product>[].obs;
  RxList<Product> get listAllProduct => _listAllProduct;
  get numOfList => _listAllProduct.length;

  set listAllProduct(value) => _listAllProduct = value;

  Future loadListsProduct() async {
    Logger().d("product controller");

    final res = await ProductService.instance.getAllProduct();
    Logger().d("product controller 1");

    _listAllProduct.value = res!.data!;

    Logger().i("getX total Load product: ${_listAllProduct.value.length}");
    return;
  }
}
