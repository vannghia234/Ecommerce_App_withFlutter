import 'package:ecommerce_app/screens/user_management/components/user_info_menu.dart';
import 'package:ecommerce_app/screens/user_management/components/user_profile_pic.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        user_profile_pic(
            image: "assets/images/avt.png",
            press: () {}), // user avt and call api change avt
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              UserInfo(
                  text: 'Tên',
                  /// user name
                  name: 'This is name from db'), // call api change info
              UserInfo(text: 'Giới tính', name: 'This is gender from db'),
              UserInfo(text: 'Số điện thoại', name: 'This is phone from db'),
              UserInfo(text: 'Đổi mật khẩu', name: ''),
              // Add more ListTiles here for each setting
            ],
          ),
        ),
      ],
    );
  }
}
