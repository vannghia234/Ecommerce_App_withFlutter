import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    print('init state user nè');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Tài khoản",
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
