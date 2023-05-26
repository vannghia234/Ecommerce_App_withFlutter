import 'package:flutter/material.dart';

import 'components/body.dart';

class UserManagementScreen extends StatelessWidget {
  static String routeName = '/usermanagement';
  const UserManagementScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông tin tài khoản",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
