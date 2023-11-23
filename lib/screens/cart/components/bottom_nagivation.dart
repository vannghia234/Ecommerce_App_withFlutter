import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/constant.dart';
import '../../../controller/get_cart_user_controller.dart';
import '../../pay_cart/pay_cart_screen.dart';

const methodList = [
  {
    "image": "assets/images/money.png",
    "text": "Tiền mặt",
  },
  {
    "image": "assets/images/unnamed.png",
    "text": "VNPAY-QR",
  },
  {
    "image": "assets/images/icons8-apple-pay-48.png",
    "text": "Apple Pay",
  },
  {
    "image": "assets/images/MoMo_Logo.png",
    "text": "MoMo",
  }
];

class BottomNavigation extends StatelessWidget {
  final controller = Get.find<GetCartUserController>();

  BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, -4),
          blurRadius: 16,
          color: Colors.black12,
        )
      ]),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.to(const PaymentMethodScreen());
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
                                      "Hình thức thanh toán khả dụng"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const paymentMethodOption(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Thêm phương thức thanh toán"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
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
                    ),
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Tổng thanh toán: ",
                        ),
                        Obx(() => Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'vi-VN', decimalDigits: 0)
                                  .format(controller.totalChoose.value),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )), // data 0
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 23.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: controller.isButtonEnabled.value
                              ? () {
                                  //call api create order dùng get
                                  Get.toNamed(PayCartScreen.routeName);
                                }
                              : null,
                          child: Obx(() =>
                              Text('Thanh toán (${controller.countChoose})')),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class paymentMethodOption extends StatefulWidget {
  const paymentMethodOption({
    super.key,
  });

  @override
  State<paymentMethodOption> createState() => _paymentMethodOptionState();
}

class _paymentMethodOptionState extends State<paymentMethodOption> {
  final controller = Get.find<GetCartUserController>();
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            methodList.length,
            (index) => GestureDetector(
                  onDoubleTap: () {
                    controller.setMethodPayment(methodList[index]['text']!,
                        methodList[index]['image']!);
                    print(controller.methodPayment.value);
                    Navigator.pop(context);
                  },
                  onTap: () {
                    setState(() {
                      isSelected = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(
                            color: isSelected == index
                                ? Colors.blue
                                : Colors.grey.shade300)),
                    child: Row(children: [
                      Image.asset(
                        // 'assets/images/icons8-cash-48.png',
                        methodList[index]['image']!,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        methodList[index]['text']!,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.check,
                        color: isSelected == index
                            ? Colors.blue
                            : Colors.transparent,
                      )
                    ]),
                  ),
                ))
      ],
    );
  }
}
