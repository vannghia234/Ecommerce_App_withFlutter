import 'package:ecommerce_app/models/address.dart';
import 'package:ecommerce_app/models/cart_product_response.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../api/carts/get_carts.dart';

class GetCartUserController extends GetxController {
  var methodPayment = 'Tiền mặt'.obs;
  var imagePayment = "assets/images/money.png".obs;
  var list = <ProductCart>[].obs;
  var listChoose = <ProductCart>[].obs;
  RxInt totalCartItem = 0.obs;
  RxInt totalChoose = 0.obs;
  RxInt countChoose = 0.obs;
  var isButtonEnabled = false.obs;

  void setMethodPayment(String method, String imagePayment) {
    methodPayment.value = method;
    this.imagePayment.value = imagePayment;
  }

  void setTotalChoose() {
    if (listChoose.isNotEmpty) {
      for (var i = 0; i < listChoose.length; i++) {
        int quantity = listChoose[i].quantity!;
        int price = listChoose[i].product!.price!;
        totalChoose += (quantity * price);
      }
    } else {
      totalChoose.value = 0;
    }
  }

  void setCountChoose() {
    countChoose.value = listChoose.length;
  }

  void incrementTotal(int price) {
    totalChoose += price;
  }

  void decreaseTotal(int price) {
    totalChoose -= price;
  }

  void updateTotal() {
    totalCartItem.value = list.length;
  }

  void addChooseProduct(ProductCart product) {
    listChoose.add(product);
    chooseProduct(product.product!.price!, product.quantity!);
    updateButtonEnabled();
  }

  void removeChooseProduct(ProductCart product) {
    listChoose.remove(product);
    unchosenProduct(product.product!.price!, product.quantity!);
    updateButtonEnabled();
  }

  void updateButtonEnabled() {
    if (countChoose.value > 0) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  void chooseProduct(int price, int quantity) {
    totalChoose += price * quantity;
    countChoose++;
    updateButtonEnabled();
  }

  void unchosenProduct(int price, int quantity) {
    totalChoose -= price * quantity;
    countChoose--;
    updateButtonEnabled();
  }

  Future getCartUser(String userId) async {
    final responseCart = await FetchApiCartService.getCart(userId);
    list.value = responseCart.data!;
    updateTotal();
    setTotalChoose();
    setCountChoose();
    Logger().d("LOAD cart user ne ${list.length} ");
    Logger().i("TOTAL CART FIRST $totalCartItem ");
    return;
  }

  Future deleteCart(String userId, String productId) async {
    final response = await FetchApiCartService.deleteCart(userId, productId);
    list.value = response.data!;
    updateTotal();
    setTotalChoose();
    setCountChoose();
    updateButtonEnabled();
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
