import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/controller/user_address_controller.dart';
import 'package:ecommerce_app/screens/pay_cart/components/paypal_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PayPalScreen extends StatefulWidget {
  const PayPalScreen({super.key});

  @override
  State<PayPalScreen> createState() => _PayPalScreenState();
}

class _PayPalScreenState extends State<PayPalScreen> {
  bool _isDisposed = false;
  @override
  void dispose() {
    _isDisposed = true;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetCartUserController>();
    final addressController = Get.find<UserAdressInfoController>();

    String totalPrice =
        convertCurrencyVNDtoUSD(controller.totalChoose.value / 1.0)
            .toStringAsFixed(1);
    print('total ${totalPrice.runtimeType}');
    double subtotal = controller.listChoose.fold<double>(
      0,
      (previousValue, element) =>
          previousValue +
          element.quantity! *
              convertCurrencyVNDtoUSD(element.product!.price! / 1.0),
    );
    Logger().i("subtoal ${subtotal.toStringAsFixed(1)}");
    Logger().i("total $totalPrice");
    double kq = 0;
    if (_isDisposed == false) {
      try {
        return UsePaypal(
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
                    "subtotal": subtotal.toStringAsFixed(1),
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                "item_list": {
                  "items": [
                    ...List.generate(
                      controller.listChoose.value.length,
                      (index) {
                        int quantity = controller.listChoose[index].quantity!;
                        kq = (controller.listChoose[index].product!.price! /
                                1.0) *
                            quantity;
                        Logger().i(
                            "kết quả product $index : ${convertCurrencyVNDtoUSD(kq).toStringAsFixed(1)}");
                        var price = kq * quantity;

                        return {
                          "name":
                              controller.listChoose[index].product?.productName,
                          "quantity": 1,
                          // "price": convertCurrencyVNDtoUSD(
                          //         controller
                          //                 .listChoose[index]
                          //                 .product!
                          //                 .price! /
                          //             1.0)
                          //     .toStringAsFixed(1),
                          "price":
                              convertCurrencyVNDtoUSD(kq).toStringAsFixed(1),
                          "currency": "USD"
                        };
                      },
                    )
                  ],

                  // shipping address is not required though
                  "shipping_address": {
                    "recipient_name": addressController
                            .addressDefault?.value.nameUserShipping ??
                        "",
                    "line1": addressController.addressDefault?.value.address,
                    "line2": "",
                    "city": "Austin",
                    "country_code": "VN",
                    "postal_code": "73301",
                    "phone": addressController.addressDefault?.value.phone,
                    "state": "Texas"
                  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              if (!_isDisposed) {
                print("onSuccess: $params");

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaypalSuccessScreen()),
                );
              }
            },
            onError: (error) {
              print("onError: $error");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaypalSuccessScreen()),
              );
            },
            onCancel: (params) {
              print('cancelled: $params');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaypalSuccessScreen()),
              );
            });
      } catch (e) {
        Logger().i(e);
      }
    }
    return const PaypalSuccessScreen();
  }
}
