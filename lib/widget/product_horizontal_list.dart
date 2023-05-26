import 'package:ecommerce_app/screens/home/components/product-card.dart';
import 'package:ecommerce_app/screens/product-detail/product-detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/product_list_response.dart';

class ProductHorizontalList extends StatelessWidget {
  const ProductHorizontalList({
    super.key,
    required this.lists,
  });
  final List<Product> lists;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(
          lists.length,
          (index) => ProductCard(
            product: lists[index],
            press: () {
              Get.toNamed(ProductDetailScreen.routeName,
                  arguments: ProductDetailArguments(lists[index]));
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
