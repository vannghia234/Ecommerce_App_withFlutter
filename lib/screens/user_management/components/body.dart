import 'package:ecommerce_app/screens/user_management/components/ExpansionTile.dart';
import 'package:ecommerce_app/screens/user_management/components/user_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login_account_info_controller.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late LoginAccountInfoController controller;
  late String imgUrl;

  @override
  void initState() {
    super.initState();
    controller = Get.find<LoginAccountInfoController>();
    if (controller.user?.avatarUrl == null) {
      imgUrl = "assets/images/basic-avt.jpg";
    } else {
      imgUrl = controller.user?.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        user_profile_pic(
            image: imgUrl, press: () {}), // user avt and call api change avt
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // call api change info
              dropDownInfo(text: 'Tên', name: '${controller.user!.fullname}'),
              dropDownInfo(
                  text: 'Số điện thoại', name: '${controller.user!.phone}'),
              dropDownInfo(text: 'Email', name: '${controller.user!.email}'),
              const dropDownInfo(text: 'Đổi mật khẩu', name: '')
              // Add more ListTiles here for each setting
            ],
          ),
        ),
      ],
    );
  }
}
