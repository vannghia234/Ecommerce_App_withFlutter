import 'package:flutter/material.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.agrs});
  final Map<String, dynamic> agrs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Hoàn tất hồ sơ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                    height: 1.5),
              ),
              const Text(
                'Hoàn tất hồ sơ của bạn \nđể tiếp tục với shop',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              CompleteProfileForm(
                agrs: agrs,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Bằng cách tiếp tục bạn xác nhận rằng bạn\n đồng ý với Điều khoản của chúng tôi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
