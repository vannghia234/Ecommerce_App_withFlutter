// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/get_cart_user_controller.dart';
import '../../models/cart_product_response.dart';
import 'components/body.dart';
import 'components/bottom_nagivation.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //stless thì dùng ở đây, nó ko bị rebuld nên chị tạo 1 lần
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      body: const Body(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
