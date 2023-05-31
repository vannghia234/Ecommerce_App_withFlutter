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

  var listFavourite = <Product>[].obs;

  final box = GetStorage();

  void addProductFavouriteList(Product product) {
    listFavourite.add(product);
  }

  void removeProductFavourite(Product product) {
    listFavourite.remove(product);
  }

  Future<void> saveProductFavourite() async {
    await box.write('productFavourite', listFavourite);
  }

  Future<void> getProductFavourite() async {
    if (box.hasData('productFavourite')) {
      listFavourite.value = box.read('productFavourite') as List<Product>;
    }
  }
}
