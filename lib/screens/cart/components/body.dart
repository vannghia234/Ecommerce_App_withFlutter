import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../configs/constant.dart';
import 'cart_item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetCartUserController>();
    final userController = Get.find<LoginAccountInfoController>();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
        child: Obx(() => controller.list.isNotEmpty
            ? ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Dismissible(
                          key: Key(controller.list[index].product!.productName
                              .toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Row(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.delete_outline,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                          onDismissed: (direction) async {
                            //showLoadingAnimation(context);
                            Logger().i(controller.listChoose.length,
                                'List choose before delete');
                            Logger().i('Product Delete',
                                controller.list[index].product!.productName!);
                            controller.listChoose
                                .remove(controller.list[index]);
                            await controller.deleteCart(
                                userController.user!.id!,
                                controller.list[index].product!.productId!);
                            Logger().i(controller.listChoose.length);
                          },
                          child: Obx(() =>
                              CartItem(cardProduct: controller.list[index])),
                        ),
                        const Divider(
                          thickness: 5,
                        ),
                        const SizedBox(height: 15),
                      ],
                    )))
            : SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2)),
                        child: const Center(
                          child: Icon(
                            Icons.local_mall_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      const Text(
                        "Giỏ hàng của bạn rỗng\nKhi bạn thêm sản phẩm,\n chúng sẽ xuất hiện ở đây",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.2,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5),
                      )
                    ]),
              )));
  }
}
