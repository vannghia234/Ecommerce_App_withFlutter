import 'package:ecommerce_app/screens/sign_up/signUpScreen.dart';
import 'package:flutter/material.dart';

import '../configs/constant.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Bạn chưa có tài khoản?',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: const Text(
            'Đăng ký',
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
