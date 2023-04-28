import 'package:ecommerce_app/screen/login_success/components/body.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_success';
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Login Success'),
      ),
      body: const Body(),
    );
  }
}
