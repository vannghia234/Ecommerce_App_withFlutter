import 'package:ecommerce_app/models/cart_product_response.dart';
import 'package:get/get.dart';

class GetCartUserController extends GetxController {
  final list = <ProductCart>[].obs;

  get getProductCart => list;

  set setProductCart(value) => list.add(value);

}

class ProductCart {
  Products? product;
  int? quantity;
  int? discount;
  bool? isSelected;

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
