import 'package:ecommerce_app/constant.dart';
import 'package:flutter/material.dart';

import 'otp_Form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'OTP Verification',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text('we sent your code to +84 233 832 ***'),
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
                'Resend OTP code',
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
          const Text('This code will exprired in 00:'),
          Text(
            '${value.toInt()}',
            style: const TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
