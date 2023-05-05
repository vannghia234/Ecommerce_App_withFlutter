import 'package:ecommerce_app/screens/home/components/product-card.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../product-detail/product-detail.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(
            productDemo.length,
            (index) => ProductCard(
                  product: productDemo[index],
                  press: () {
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: ProductDetailArguments(productDemo[index]));
                  },
                )),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
