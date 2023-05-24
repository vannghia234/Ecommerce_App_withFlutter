// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/screens/pay_history/pay_history_screen.dart';
import 'package:ecommerce_app/screens/user_management/user_management_screen.dart';
import 'package:ecommerce_app/screens/user_profile/components/profile_menu.dart';
import 'package:ecommerce_app/screens/user_profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginAccountInfoController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const ProfilePic(),
              const SizedBox(height: 10),
              Text('Tên User',
                  style: Theme.of(context).textTheme.headlineSmall),
              Text('${controller.user?.email}'),
              const SizedBox(height: 20),
              ProfileMenu(
                  icon: "assets/icons/User Icon.svg",
                  text: "Quản lý tài khoản",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserManagementScreen(),
                        ));
                  }),
              ProfileMenu(
                  icon: "assets/icons/Bell.svg",
                  text: "Thông báo",
                  press: () {}),
              ProfileMenu(
                  icon: "assets/icons/Settings.svg",
                  text: "Đơn hàng",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PayHistoryScreen(),
                        ));
                  }),
              ProfileMenu(
                  icon: "assets/icons/User Icon.svg",
                  text: "Trung tâm hỗ trợ",
                  press: () {}),
              ProfileMenu(
                  icon: "assets/icons/User Icon.svg",
                  text: "Đăng xuất",
                  press: () {}),
            ])),
      ),
    );
  }
}
