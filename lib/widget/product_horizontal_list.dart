import 'package:flutter/cupertino.dart';

import '../models/product_list_response.dart';

class ProductHorizontalList extends StatelessWidget {
  const ProductHorizontalList({
    super.key,
    required this.lists,
  });
  final List<Product> lists;

  @override
  Widget build(BuildContext context) {
    print('in listt---${lists[8].productName}');
    return Row(children: [
      ...List.generate(
        lists.length,
        (index) => Text(index.toString()),
      ),
      // (index) => ProductCard(
      //       product: lists[index],
      //       press: () {
      //         Get.toNamed(ProductDetailScreen.routeName,
      //             arguments: ProductDetailArguments(lists[index]));
      //       },
      //     )),
      const SizedBox(
        height: 20,
      )
    ]);
  }
}
