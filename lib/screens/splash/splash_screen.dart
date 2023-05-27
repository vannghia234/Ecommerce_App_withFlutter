import 'package:ecommerce_app/api/carts/push_api.dart';
import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screens/splash/component/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";
  void load() async {
    final controller1 = Get.put(ProductController());
    final authController = Get.put(AuthController());
    await PushApiCartService.instance
        .addToCart(productId: 'a65c9429-470e-4b4e-9b61-2d4a73c1f2b7');
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
