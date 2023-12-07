import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../controller/login_account_info_controller.dart';
import '../../../controller/order_controller.dart';
import '../../../models/cart_product_response.dart';
import '../../../widget/default_button.dart';
import '../../after-order/after-order-screen.dart';

class bottomCart extends StatelessWidget {
  bottomCart({super.key});
  final controller = Get.find<GetCartUserController>();
  final CreateOrderController createCartController =
      Get.put(CreateOrderController());
  final LoginAccountInfoController userController =
      Get.find<LoginAccountInfoController>();

  @override
  Widget build(BuildContext context) {
    Logger().i('${chooseProduct.length} logggggg ');
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(30),
          //   topRight: Radius.circular(30),
          // ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -6),
              blurRadius: 20,
              color: Colors.black12,
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
                    Obx(() => Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'vi-VN', decimalDigits: 0)
                              .format(controller.totalChoose.value),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        )),
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
                    Logger().i('Dang dat hang');
                    // showLoadingAnimation(context);
                    final cartController = Get.find<GetCartUserController>();
                    if (cartController.methodPayment.value == 'Tiền mặt') {
                      createCartController.createOrder(
                          userController.user.id!,
                          '423e4567-e89b-12d3-a456-426614174000',
                          controller.listChoose.value);
                      Get.to(() => ThanksForBuying());
                    } else {
                      if (controller.methodPayment != "Tiền mặt") {
                        String totalPrice = convertCurrencyVNDtoUSD(
                                controller.totalChoose.value / 1.0)
                            .toStringAsFixed(1);
                        print('total ${totalPrice.runtimeType}');

                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => UsePaypal(
                                sandboxMode: true,
                                clientId:
                                    "ATzu3Ilt8ZvKGWhYzP8MyTCCw5CB34rvFYhLI8qTC0YyvFh3LfdxW1BfDpYCwqK5K4gzqrCUT9F3DSPB",
                                secretKey:
                                    "EKks2c_35ntpG42KJ8vwYGXia-wRCG9yF6U_Sv35WKaYyXm6uPGwuCrmZIkgrMcUwPRQ7R8KuWiabvxl",
                                returnURL: "https://samplesite.com/return",
                                cancelURL: "https://samplesite.com/cancel",
                                transactions: [
                                  {
                                    "amount": {
                                      "total": totalPrice,
                                      "currency": "USD",
                                      "details": {
                                        "subtotal": totalPrice,
                                        "shipping": '0',
                                        "shipping_discount": 0
                                      }
                                    },
                                    "description":
                                        "The payment transaction description.",
                                    "item_list": {
                                      "items": [
                                        ...List.generate(
                                            controller.listChoose.value.length,
                                            (index) => {
                                                  "name": controller
                                                      .listChoose[index]
                                                      .product
                                                      ?.productName,
                                                  "quantity": controller
                                                      .listChoose[index]
                                                      .quantity,
                                                  "price": totalPrice,
                                                  "currency": "USD"
                                                })
                                      ],

                                      // shipping address is not required though
                                      "shipping_address": const {
                                        "recipient_name": "Jane Foster",
                                        "line1": "Travis County",
                                        "line2": "",
                                        "city": "Austin",
                                        "country_code": "US",
                                        "postal_code": "73301",
                                        "phone": "+00000000",
                                        "state": "Texas"
                                      },
                                    }
                                  }
                                ],
                                note:
                                    "Contact us for any questions on your order.",
                                onSuccess: (Map params) async {
                                  print("onSuccess: $params");
                                  Get.back();
                                  // Get.offAll(() => ThanksForBuying());
                                },
                                onError: (error) {
                                  print("onError: $error");
                                },
                                onCancel: (params) {
                                  print('cancelled: $params');
                                }),
                          ),
                        );

                        // Get.toNamed(PayCartScreen.routeName);
                      }
                    }
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
