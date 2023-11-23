import 'package:ecommerce_app/auth_service.dart';
import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/screens/sign_in/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/show_loading_tabbar.dart';
import '../../../widget/socialCard.dart';
import '../../../widget/noAccountText.dart';

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
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const Text(
                  'Chào mừng đã trở lại',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black),
                ),
                const Text(
                  'Đăng nhặp với tài khoản và mật khẩu\nhoặc tiếp tục với ứng dụng',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                const SignInForm(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () async {
                        final controllerGg = Get.find<AuthService>();
                        showLoadingAnimationTabbar(context);
                        try {
                          final gg = await controllerGg.signInWithGoogle();
                        } catch (e) {
                          Get.back();
                          return;
                        }
                        Get.back();
                        Get.to(() => const RootApp());
                      },
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {

                      },
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
