import 'package:ecommerce_app/controller/otp_controller.dart';
import 'package:ecommerce_app/screens/otp/components/Body.dart';
import 'package:ecommerce_app/utils/email_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = '/otp_screen';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Xác minh mã OTP'),
      ),
      body: const Body(),
    );
  }
}
