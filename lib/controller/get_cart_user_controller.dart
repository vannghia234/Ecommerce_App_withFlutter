import 'package:get/get.dart';

import '../models/product_list_response.dart';

class GetCartUser extends GetxController {
  ProductCart? productCart;

  get getProductCart => productCart;
}

class ProductCart {
  Product? product;
  int? quantity;
  bool? isSelected;

  ProductCart({
    this.product,
    this.quantity,
    this.isSelected = false,
  });
}
