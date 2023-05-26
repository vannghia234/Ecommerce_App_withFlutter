import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/screens/splash/component/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";
  Future<void> load() async {
    final controller1 = Get.put(ProductController());

    await controller1.loadListsProduct();
    await controller1.loadListsCategory();
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
