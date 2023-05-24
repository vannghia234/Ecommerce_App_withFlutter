import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/user/fetch_api_service.dart';
import '../../controller/login_account_info_controller.dart';
import '../../models/UserResponse.dart';
import 'components/body.dart';

class UserProfileScreen extends StatefulWidget {
  static String routeName = '/userprofile';
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late Future<UserResponse?> futureUser;
  late LoginAccountInfoController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<LoginAccountInfoController>();
    print('init state user nè');
    futureUser = FetchApiService.instance
        .getUserById("61aa50f0-c8ba-4387-8e13-b9d505d8ea35");
  }

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
      body: Body(controller: controller),
    );
  }
}
