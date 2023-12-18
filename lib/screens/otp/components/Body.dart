import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/otp_controller.dart';
import 'package:ecommerce_app/utils/email_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'otp_Form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController controllerOtp = Get.find<OtpController>();

    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Icon(Icons.search),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Mã xác minh OTP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            FittedBox(
                child: Text(
                    'Đã gửi mã xác minh tới ${controllerOtp.email.value.replaceRange(4, 8, "***")}')),
            buildTimer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const OtpForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Gửi lại mã OTP',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    ));
  }

  TweenAnimationBuilder<double> buildTimer() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 30, end: 0),
      duration: const Duration(seconds: 30),
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Mã code sẽ hết hạn trong 00:'),
          Text(
            '${value.toInt()}',
            style: const TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
