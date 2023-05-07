import 'package:flutter/material.dart';

import 'components/body.dart';

class UserProfileScreen extends StatelessWidget {
  static String routeName = '/userprofile';
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tài khoản",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
