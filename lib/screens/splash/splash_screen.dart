import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screens/splash/component/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favourite_controller.dart';
import '../../controller/order-detail-controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/product_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";
  void load() async {
    final orderController = Get.put(OrderController());
    final orderDetailController = Get.put(OrderDetailController());
    final controller1 = Get.put(ProductController());
    final authController = Get.put(AuthController());
    final favouriveController = Get.put(FavouriteController());

    // await controller1.loadListsProduct();
    // await controller1.loadListsCategory();
  }

  @override
  Widget build(BuildContext context) {
    load();
    SizeConfig.init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
