import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:ecommerce_app/screens/pay_cart/components/paycart_item.dart';
import 'package:ecommerce_app/screens/shipping-address/shipping-address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_address_controller.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cartController = Get.find<GetCartUserController>();

  final addressController = Get.find<UserAdressInfoController>();
  String address = "";
  String shippingName = "";
  String phone = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address = addressController.addressDefault?.value.address ?? 'trống';
    print(address);
    shippingName =
        addressController.addressDefault?.value.nameUserShipping ?? 'trống';
    phone = addressController.addressDefault?.value.phone ?? 'trống';
    print(shippingName);
  }

  @override
  Widget build(BuildContext context) {
    // print('address nè ${addressController.addressDefault!.value.address!}');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 7, spreadRadius: 1)
                ],
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 0.3,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return Expanded(
                          child: Text(
                            addressController
                                    .addressDefault?.value.nameUserShipping ??
                                'trống',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        );
                      }),
                      Obx(() {
                        return Expanded(
                          flex: 3,
                          child: Text(
                            addressController.addressDefault?.value.address ??
                                'trống',
                            style: const TextStyle(fontSize: 15),
                          ),
                        );
                      })
                      // Expanded(child:
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        addressController.addressDefault?.value.phone ??
                            'trống',
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const ShippingAddress());
                          },
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
      ),
    );
  }
}
