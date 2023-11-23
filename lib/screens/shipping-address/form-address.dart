import 'package:flutter/material.dart';

import 'components/body-form-address.dart';

class FormAddress extends StatelessWidget {
  static String routeName = '/formAddress';
  const FormAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Thêm địa chỉ giao hàng',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: const BodyFormAddress(),
    );
  }
}
