import 'package:ecommerce_app/screens/sign_up/components/signUpForm.dart';
import 'package:flutter/material.dart';

import '../../../widget/socialCard.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Đăng ký tài khoản',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                    height: 1.5),
              ),
              const Text(
                'Hoàn tất việc đăng ký & tiến hành mua sắm',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              const SignUpForm(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Bằng cách tiếp tục bạn xác nhận rằng bạn\n đồng ý với Điều khoản của chúng tôi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
