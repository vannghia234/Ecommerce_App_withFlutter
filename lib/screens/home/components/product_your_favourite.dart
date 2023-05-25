import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../../widget/product_horizontal_list.dart';

class ProductYourFavourite extends StatelessWidget {
  const ProductYourFavourite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ProductHorizontalList(lists: controller.listAllProduct)
    );
  }
}