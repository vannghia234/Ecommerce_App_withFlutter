import 'package:ecommerce_app/models/cart_product_response.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../api/carts/get_carts.dart';

class GetCartUserController extends GetxController {
  var list = <ProductCart>[].obs;
  RxInt totalCartItem = 0.obs;

  void updateTotal() {
    totalCartItem.value = list.length;
  }

  Future getCartUser(String userId) async {
    final responseCart = await FetchApiCartService.getCart(userId);
    list.value = responseCart.data!;
    updateTotal();
    Logger().d("LOAD cart user ne ${list.length} ");
    Logger().i("TOTAL CART FIRST $totalCartItem ");
    return;
  }
}

class ProductCart {
  Products? product;
  int? quantity;
  int? discount;
  bool? isSelected = false;

  ProductCart({
    this.product,
    this.quantity,
    this.isSelected = false,
    this.discount,
  });

  ProductCart.fromJson(Map<String, dynamic> json) {
    quantity = json["quantity"];
    discount = json["discount"];
    product =
        json["products"] == null ? null : Products.fromJson(json["products"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["quantity"] = quantity;
    data["discount"] = discount;
    if (product != null) {
      data["products"] = product?.toJson();
    }
    return data;
  }
}
