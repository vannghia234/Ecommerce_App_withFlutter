import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/constant.dart';
import 'cart_item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetCartUserController>();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
        child: ListView.builder(
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
                      onDismissed: (direction) {
                        // setState(() {
                        //   chooseProduct.remove(controller.list[index].product);
                        //   controller.list
                        //       .remove(controller.list[index].product!);
                        // });
                      },
                      child: Obx(
                          () => CartItem(cardProduct: controller.list[index])),
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    const SizedBox(height: 15),
                  ],
                ))));
  }
}
