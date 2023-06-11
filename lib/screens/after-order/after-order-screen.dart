import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../configs/constant.dart';
import '../home/home_screen.dart';

class ThanksForBuying extends StatelessWidget {
  ThanksForBuying({Key? key}) : super(key: key);
  static String routeName = "/thanks";
  final cartController = Get.find<GetCartUserController>();
  final LoginAccountInfoController userController =
      Get.find<LoginAccountInfoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animations/Comp.json",
            height: 340,
            width: 300,
          ),
          const Text(
            'Thanks for buying!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Đơn hàng của bạn đang được xử lý',
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor, // Set the color here
                ),
                onPressed: () {
                  //Get.put();
                  // Navigate to home screen or any other screen as needed
                  //cartController.getCartUser(userController.user!.id!);
                  Get.toNamed(HomeScreen.routeName);
                },
                child: const Text('Xem đơn hàng'),
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor, // Set the color here
                ),
                onPressed: () async {
                  //Get.put();
                  // Navigate to home screen or any other screen as needed
                  //cartController.getCartUser(userController.user!.id!);
                  await cartController.getCartUser(userController.user!.id!);
                  Get.toNamed(HomeScreen.routeName);
                },
                child: const Text('Tiếp tục mua sắm'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
