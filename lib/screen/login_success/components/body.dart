import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        Image.asset(
          'assets/images/success.png',
          height: size.height * 0.4,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        const Text(
          'Login Success',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const Spacer(),
        SizedBox(
          width: size.width * 0.6,
          child: DefaultButton(
            text: 'Back to home',
            press: () {},
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
