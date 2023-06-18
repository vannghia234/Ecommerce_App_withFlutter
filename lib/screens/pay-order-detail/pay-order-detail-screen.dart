import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String routeName = '/orderDetail';

  const OrderDetailsScreen({super.key, required this.orderDetails});
  final List<OrderDetails> orderDetails;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết đơn hàng"),
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
      body: Body(args: orderDetails),
    );
  }
}
