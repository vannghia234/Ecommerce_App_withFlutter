import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/screens/search-screen/components/product-card-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'custom-product-list.dart';

class AllProductList extends StatelessWidget {
  const AllProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProductListLayout();
  }
}
