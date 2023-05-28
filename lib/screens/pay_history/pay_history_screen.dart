import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/order_controller.dart';
import 'components/body.dart';

class PayHistoryScreen extends StatelessWidget {
  static String routeName = '/payHistory';
  PayHistoryScreen({super.key});
  final userController = Get.find<LoginAccountInfoController>();

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    orderController.loadListOrder(userController.user!.id!);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch sử mua hàng"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              //Get.toNamed(const OrderDetailsScreen());
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black,
            )),
      ),
      body: Body(),
    );
  }
}
