import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../controller/login_account_info_controller.dart';
import '../../../controller/order_controller.dart';
import '../../../controller/update-total-controller.dart';
import '../../../models/cart_product_response.dart';
import '../../../widget/default_button.dart';
import '../../after-order/after-order-screen.dart';

class bottomCart extends StatelessWidget {
  bottomCart({super.key});
  final TotalController controller = Get.find<TotalController>();
  final CreateOrderController createCartController =
      Get.put(CreateOrderController());
  final LoginAccountInfoController userController =
      Get.find<LoginAccountInfoController>();

  @override
  Widget build(BuildContext context) {
    Logger().i('${chooseProduct.length} logggggg ');
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.9),
            )
          ]),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text.rich(TextSpan(
                      text: "Tổng thanh toán:",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black),
                    )),
                    Obx(() => Text('${controller.total}')),
                  ],
                ),
              ),
              const SizedBox(
                width: 23.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 50,
                child: DefaultButton(
                  text: "Đặt hàng",
                  press: () async {
                    final res = createCartController.createOrder(
                        userController.user!.id!,
                        '423e4567-e89b-12d3-a456-426614174000');
                    Get.back();
                    Get.to(const ThanksForBuying());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
