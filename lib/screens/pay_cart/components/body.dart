import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/screens/pay_cart/components/paycart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login_account_info_controller.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final controller = Get.find<LoginAccountInfoController>();
  final cartController = Get.find<GetCartUserController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 130.99,
            width: 335,
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.0,
                  width: 335,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('${controller.user!.fullname}'),
                          ),
                          const Expanded(
                              flex: 2,
                              child: Text(
                                  '44/1f Tân Hiệp 32, Tân Hiệp, Hóc Môn, Tp. Hồ Chí Minh'))
                          // Expanded(child:
                          // //Text('${controller.user.}'))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                'Thay đổi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
              child: Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cartController.listChoose.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              PayCartItem(
                                  cartProduct:
                                      cartController.listChoose[index]),
                              const Divider()
                            ],
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
