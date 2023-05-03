import 'package:ecommerce_app/screens/user_management/user_management_screen.dart';
import 'package:ecommerce_app/screens/user_profile/components/profile_menu.dart';
import 'package:ecommerce_app/screens/user_profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const ProfilePic(),
          const SizedBox(height: 10),
          Text('Tên User', style: Theme.of(context).textTheme.headlineSmall),
          const Text('Mail User@gmail.com'),
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
              icon: "assets/icons/Bell.svg", text: "Thông báo", press: () {}),
          ProfileMenu(
              icon: "assets/icons/Settings.svg",
              text: "Đơn hàng",
              press: () {}),
          ProfileMenu(
              icon: "assets/icons/User Icon.svg",
              text: "Trung tâm hỗ trợ",
              press: () {}),
          ProfileMenu(
              icon: "assets/icons/User Icon.svg",
              text: "Đăng xuất",
              press: () {}),
        ]));
  }
}
