import 'package:ecommerce_app/models/product_list_response.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductFavourite();
  }

  RxList<Product> listFavourite = <Product>[].obs;

  final box = GetStorage();

  void addProductFavouriteList(Product product) {
    for (var element in listFavourite.value) {
      if (product.productId == element.productId) {
        return;
      }
    }
    listFavourite.add(product);
    saveProductFavourite();
  }

  void removeProductFavourite(Product product) {
    listFavourite.remove(product);
    for (var element in listFavourite) {
      element.isFavourite = true;
    }
    saveProductFavourite();
  }

  Future<void> saveProductFavourite() async {
    await box.write('productFavourite', listFavourite);
  }

  Future<void> getProductFavourite() async {
    if (box.hasData('productFavourite')) {
      final listDynamic = box.read('productFavourite') as List<dynamic>;
      listFavourite.assignAll(listDynamic.map((dynamic item) {
        print(item['category']);
        var product = Product.fromJson(item);
        product.isFavourite = true;
        return product;
      }).toList());
    }
  }
}
