import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/controller/order-detail-controller.dart';
import 'package:ecommerce_app/controller/order_controller.dart';
import 'package:ecommerce_app/screens/pay_history/components/pay_history_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../pay-order-detail/pay-order-detail-screen.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final orderController = Get.find<OrderController>();
  final orderDetailController = Get.put(OrderDetailController());
  final userController = Get.find<LoginAccountInfoController>();
  @override
  Widget build(BuildContext context) {
    Logger().i('Log Order ${orderController.listAllOrder.length}');
    Logger()
        .i('Log Order Detail ${orderDetailController.listOrderDetail.length}');
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: orderController.listAllOrder.length -1 ,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Divider(
                    thickness: 4,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text.rich(TextSpan(
                        text: orderController.listAllOrder[index].status,
                        style: const TextStyle(
                          color: kPrimaryColor,
                        ))),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(() => OrderDetailsScreen(
                              orderDetails: orderController
                                  .listAllOrder[index].orderDetail!,
                            ));
                      },
                      child: PayHistoryItem(
                          detail: orderController
                              .listAllOrder[index].orderDetail![0])),
                  const Divider(thickness: 2),
                  Row(
                    children: [
                      Text.rich(TextSpan(
                          text:
                              'Số lượng sản phẩm: ${orderController.listAllOrder[index].orderDetail!.length}')),
                      const Spacer(),
                      Text.rich(TextSpan(
                          text:
                              'Tổng tiền: ${orderController.listAllOrder[index].totalPrice}'))
                    ],
                  )
                ],
              ))),
    );
  }
}
