// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/controller/user_address_controller.dart';
import 'package:ecommerce_app/models/useraddress-response.dart';
import 'package:ecommerce_app/screens/shipping-address/form-address.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login_account_info_controller.dart';
import '../../../widget/show_loading_animation.dart';

class AddressInfomation {
  final String name;
  final String address;
  final String sdt;
  AddressInfomation({
    required this.name,
    required this.address,
    required this.sdt,
  });
}

class BodyShippingAdress extends StatefulWidget {
  const BodyShippingAdress({super.key});

  @override
  State<BodyShippingAdress> createState() => _BodyShippingAdressState();
}

class _BodyShippingAdressState extends State<BodyShippingAdress> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerAdress = Get.find<UserAdressInfoController>();
    focus = controllerAdress.addressDefault?.value ?? Address();
  }

  late UserAdressInfoController controllerAdress;
  late Address focus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAdress.listAddress.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              focus = controllerAdress.listAddress[index];
                            });
                          },
                          child: AddressInfo(
                            address:
                                controllerAdress.listAddress[index].address ??
                                    "trống",
                            name: controllerAdress
                                    .listAddress[index].nameUserShipping ??
                                "trống",
                            isSelected:
                                focus == controllerAdress.listAddress[index],
                            sdt: controllerAdress.listAddress[index].phone ??
                                "trống",
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const FormAddress());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 24),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: const Column(children: [
                      Icon(Icons.add),
                      Text(
                        'Thêm địa chỉ mới',
                        style: TextStyle(fontSize: 19),
                      )
                    ]),
                  ),
                ),
                DefaultButton(
                  text: 'Tiếp Tục',
                  press: () async {
                    final controllerUser =
                        Get.find<LoginAccountInfoController>();
                    showLoadingAnimation(context);
                    await controllerAdress.updateStatusAddress(
                        controllerUser.user.id!, focus.id!);
                    await controllerAdress
                        .getAddressUser(controllerUser.user.id!);
                    Get.back();
                    // controllerAdress.updateStatusIndex(focus);
                    // Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.address,
    required this.sdt,
    required this.name,
    required this.isSelected,
  });
  final String address;
  final String sdt;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 3))
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AddressShipping(
            address: address,
            name: name,
            sdt: sdt,
          ),
          isSelected
              ? const Column(
                  children: [
                    Text(
                      'Default',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.deepOrange,
                    )
                  ],
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}

class AddressShipping extends StatelessWidget {
  const AddressShipping({
    super.key,
    required this.name,
    required this.address,
    required this.sdt,
  });
  final String name;
  final String address;
  final String sdt;

  @override
  Widget build(BuildContext context) {
    String nameFitler =
        address.length > 35 ? '${address.substring(0, 36)}...' : address;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              sdt,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              nameFitler,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
