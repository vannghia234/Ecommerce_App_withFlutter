import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../models/product_list_response.dart';
import '../screens/product-detail/product-detail.dart';
import '../screens/search-screen/components/product-card-item.dart';

class TabbarViewProduct extends StatelessWidget {
  const TabbarViewProduct({super.key, required this.productLists});
  final List<Product> productLists;

  @override
  Widget build(BuildContext context) {
    return Obx(() => productLists.isNotEmpty
        ? GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 40,
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 4 / 7,
            children: [
              ...List.generate(
                  productLists.length,
                  (index) => ProductCardItem(
                        product: productLists[index],
                        press: () {
                          Get.toNamed(ProductDetailScreen.routeName,
                              arguments:
                                  ProductDetailArguments(productLists[index]));
                        },
                      ))
            ],
          )
        : Center(
            child: SvgPicture.asset(
              'assets/images/nodata.svg',
              height: 500,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ));
  }
}
