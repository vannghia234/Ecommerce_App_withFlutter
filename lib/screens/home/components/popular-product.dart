import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';
import '../../../widget/product_horizontal_list.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return ProductHorizontalList(
      lists: controller.listAllProduct,
    );
  }
}
