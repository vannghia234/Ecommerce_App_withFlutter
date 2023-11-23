// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_nagivation.dart';
import 'package:ecommerce_app/screens/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<GetCartUserController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            cart.listChoose.clear();
            Get.offAll(() => const RootApp());
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text('Giỏ hàng'),
        centerTitle: true,
      ),
      body: const Body(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
