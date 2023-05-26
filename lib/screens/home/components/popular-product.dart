import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../controller/product_controller.dart';
import '../../../widget/product_horizontal_list.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    Logger().i(
        'GetX total Popular products  ${controller.listAllProduct.value.length}');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ProductHorizontalList(
        lists: controller.listAllProduct,
      ),
    );
  }
}
