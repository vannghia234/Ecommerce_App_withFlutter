import 'package:ecommerce_app/screens/product-detail/product-detail.dart';
import 'package:ecommerce_app/screens/search-screen/components/product-card-item.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class CustomProductListLayout extends StatelessWidget {
  const CustomProductListLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 40,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 4 / 6,
      children: [
        ...List.generate(
            productDemo.length,
            (index) => ProductCardItem(
                  product: productDemo[index],
                  press: () {
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: ProductDetailArguments(productDemo[index]));
                  },
                ))
      ],
    );
  }
}
