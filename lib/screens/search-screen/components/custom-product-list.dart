import 'package:ecommerce_app/models/product_list_response.dart';
import 'package:ecommerce_app/screens/product-detail/product-detail.dart';
import 'package:ecommerce_app/screens/search-screen/components/product-card-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductListLayout extends StatefulWidget {
  const CustomProductListLayout({
    super.key,
    required this.productLists,
  });
  final List<Product> productLists;

  @override
  State<CustomProductListLayout> createState() =>
      _CustomProductListLayoutState();
}

class _CustomProductListLayoutState extends State<CustomProductListLayout> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 40,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 4 / 6,
          children: [
            ...List.generate(
                widget.productLists.length,
                (index) => ProductCardItem(
                      product: widget.productLists[index],
                      press: () {
                        Navigator.pushNamed(
                            context, ProductDetailScreen.routeName,
                            arguments: ProductDetailArguments(
                                widget.productLists[index]));
                      },
                    ))
          ],
        ));
  }
}
