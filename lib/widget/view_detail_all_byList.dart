import 'package:ecommerce_app/models/product_list_response.dart';
import 'package:ecommerce_app/widget/search-view-btn.dart';
import 'package:flutter/material.dart';

import '../screens/search-screen/components/custom-product-list.dart';

class ViewDetailAllByList extends StatelessWidget {
  static String routeName = '/result-search1';
  const ViewDetailAllByList(
      {super.key, required this.title, required this.productLists});

  final String title;
  final List<Product> productLists;

  @override
  Widget build(BuildContext context) {
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
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        child: CustomProductListLayout(productLists: productLists),
      ),
    );
  }
}
