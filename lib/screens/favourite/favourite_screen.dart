import 'package:ecommerce_app/controller/favourite_controller.dart';
import 'package:ecommerce_app/screens/search-screen/components/custom-product-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = '/favourite';
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavouriteController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'My Favourite',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomProductListLayout(productLists: controller.listFavourite)
          ]),
        ),
      ),
    );
  }
}
