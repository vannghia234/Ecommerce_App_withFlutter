import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../change-password-screen/change-password-screen.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.text,
    required this.name,
  });
  final String text, name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(name),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.to(UpdatePasswordScreen());
      },
    );
  }
}
