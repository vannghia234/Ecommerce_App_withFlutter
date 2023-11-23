import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/api/constant.dart';
import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/controller/user_address_controller.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:ecommerce_app/widget/show_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BodyFormAddress extends StatefulWidget {
  const BodyFormAddress({super.key});

  @override
  State<BodyFormAddress> createState() => _BodyFormAddressState();
}

class _BodyFormAddressState extends State<BodyFormAddress> {
  @override
  void dispose() {
    // TODO: implement dispose
    controllerName.dispose();
    controllerSdt.dispose();
    controllerAdd.dispose();
    super.dispose();
  }

  bool turnOnSwitch = false;
  final controllerName = TextEditingController();
  final controllerSdt = TextEditingController();
  final controllerAdd = TextEditingController();
  final globalKeyAdress = GlobalKey<FormState>();
  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Track color when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );
  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Material color when switch is selected.
      if (states.contains(MaterialState.selected)) {
        return kPrimaryColor;
      }
      // Material color when switch is disabled.
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      // Otherwise return null to set default material color
      // for remaining states such as when the switch is
      // hovered, or focused.
      return null;
    },
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
              key: globalKeyAdress,
              child: SizedBox(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                      controller: controllerName,
                      decoration: const InputDecoration(
                          hintText: 'Họ tên', labelText: 'Họ tên'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                      controller: controllerSdt,
                      decoration: const InputDecoration(
                          hintText: 'Số điện thoại', labelText: 'SĐT'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                      controller: controllerAdd,
                      decoration: const InputDecoration(
                          hintText: 'Địa chỉ', labelText: 'Địa chỉ'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Đặt mặc định',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          thumbColor: const MaterialStatePropertyAll<Color>(
                              Colors.black),
                          overlayColor: overlayColor,
                          trackColor: trackColor,
                          value: turnOnSwitch,
                          onChanged: (value) {
                            setState(() {
                              turnOnSwitch = !turnOnSwitch;
                            });
                          },
                        )
                      ],
                    ),
                    // const Spacer(),
                  ],
                ),
              )),
          const Spacer(),
          DefaultButton(
            text: 'Lưu địa chỉ',
            press: () async {
              if (globalKeyAdress.currentState?.validate() == true) {
                final controllerAddress = Get.find<UserAdressInfoController>();
                final controllerUser = Get.find<LoginAccountInfoController>();
                // Address add = Address();
                // add.address = controllerAdd.text;
                // add.isDefault = false;
                // add.nameUserShipping = controllerName.text;
                showLoadingAnimation(context);

                final kq = await http.get(
                    Uri.parse(ApiUrl.apiGetLocation + controllerAdd.text),
                    headers: header);
                Get.back();
                final js = jsonDecode(kq.body);

                // add.location = js["location"];
                // Logger().i('location: ${js["location"]}');
                // add.phone = controllerSdt.text;
                await controllerAddress.postAddressUser(
                    address: controllerAdd.text,
                    location: js["location"],
                    sdt: controllerSdt.text,
                    userId: controllerUser.user.id!,
                    userNameShipping: controllerName.text);
                // await controllerAddress.postAddressUser(
                //     controllerUser.user.id!,
                //     controllerName.text,
                //     controllerSdt.text,
                //     controllerAdd.text);
                // controllerAddress.listAddress.add(Address(
                //     nameUserShipping: controllerName.text,
                //     phone: controllerSdt.text,
                //     address: controllerAdd.text));
                // controllerAddress.listAddress.refresh();

                Get.back();
                // Navigator.pop(context);
              }
            },
          )
        ],
      ),
    ));
  }
}
