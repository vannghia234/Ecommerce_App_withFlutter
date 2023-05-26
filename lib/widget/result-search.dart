import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/widget/search-view-btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/search-screen/components/custom-product-list.dart';

class ResultSearchScreen extends StatelessWidget {
  static String routeName = '/result-search';
  const ResultSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments;
    final rs = result as String;
    final controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          rs,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchViewButton.routeName);
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CustomProductListLayout(
            productLists: controller.listsearchProductByName),
      ),
    );
  }
}
