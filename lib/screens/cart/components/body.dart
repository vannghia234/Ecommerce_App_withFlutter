import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/cart/components/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/get_cart_user_controller.dart';
import 'cart_item.dart';

// so th này ko convert qua stless dc nhừo
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late GetCartUserController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<GetCartUserController>();
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Row(
                          children: const [
                            Spacer(),
                            Icon(
                              Icons.delete_outline,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          chooseProduct.remove(controller.list[index].product);
                          controller.list
                              .remove(controller.list[index].product!);
                        });
                      },
                      child: CartItem(cardProduct: controller.list[index]),
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    const SizedBox(height: 15),
                  ],
                ))));
  }
}
// nó dừng