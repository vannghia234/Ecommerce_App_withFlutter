import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/controller/user_address_controller.dart';
import 'package:ecommerce_app/screens/pay_cart/components/paypal_success.dart';
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
import '../../cart/components/bottom_nagivation.dart';

class bottomCart extends StatelessWidget {
  bottomCart({super.key});
  final controller = Get.find<GetCartUserController>();
  final CreateOrderController createCartController =
      Get.put(CreateOrderController());
  final LoginAccountInfoController userController =
      Get.find<LoginAccountInfoController>();
  final addressController = Get.find<UserAdressInfoController>();

  @override
  Widget build(BuildContext context) {
    Logger().i('${chooseProduct.length} logggggg ');
    var gestureDetector = GestureDetector(
      onTap: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (context) => Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              title: const Text("Hình thức thanh toán"),
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new)),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hình thức thanh toán khả dụng".toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const paymentMethodOption(),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Thêm phương thức thanh toán".toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Obx(() {
            return Image.asset(
              controller.imagePayment.value,
              width: 28,
              height: 28,
            );
          }),
          const SizedBox(
            width: 2,
          ),
          Obx(() {
            return Text(controller.methodPayment.value);
          }),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
        ],
      ),
    );
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -6),
              blurRadius: 20,
              color: Colors.black12,
            )
          ]),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gestureDetector,
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Ưu đãi',
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                    ],
                  ),
                  const SizedBox(
                    width: 23.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: DefaultButton(
                      text: "Đặt hàng",
                      press: () {
                        Logger().i('Dang dat hang');
                        // showLoadingAnimation(context);
                        final cartController =
                            Get.find<GetCartUserController>();
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
                            double subtotal =
                                controller.listChoose.fold<double>(
                              0,
                              (previousValue, element) =>
                                  previousValue +
                                  element.quantity! *
                                      convertCurrencyVNDtoUSD(
                                          element.product!.price! / 1.0),
                            );
                            Logger()
                                .i("subtoal ${subtotal.toStringAsFixed(1)}");
                            Logger().i("total $totalPrice");

                            Get.to(() => UsePaypal(
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
                                      "total": totalPrice.toString(),
                                      "currency": "USD",
                                      "details": {
                                        "subtotal": totalPrice.toString(),
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
                                                  "quantity": 1,
                                                  "price":
                                                      convertCurrencyVNDtoUSD(
                                                              controller
                                                                      .listChoose[
                                                                          index]
                                                                      .product!
                                                                      .price! /
                                                                  1.0)
                                                          .toStringAsFixed(1),
                                                  "currency": "USD"
                                                })
                                      ],

                                      // shipping address is not required though
                                      "shipping_address": {
                                        "recipient_name": addressController
                                                .addressDefault
                                                ?.value
                                                .nameUserShipping ??
                                            "",
                                        "line1": addressController
                                            .addressDefault?.value.address,
                                        "line2": "",
                                        "city": "Austin",
                                        "country_code": "VN",
                                        "postal_code": "73301",
                                        "phone": addressController
                                            .addressDefault?.value.phone,
                                        "state": "Texas"
                                      },
                                    }
                                  }
                                ],
                                note:
                                    "Contact us for any questions on your order.",
                                onSuccess: (Map params) async {
                                  print("onSuccess: $params");
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PaypalSuccessScreen(),
                                    ),
                                  );
                                },
                                onError: (error) {
                                  print("onError: $error");
                                },
                                onCancel: (params) {
                                  print('cancelled: $params');
                                }));

                            // Get.toNamed(PayCartScreen.routeName);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
