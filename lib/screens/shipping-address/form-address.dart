import 'package:flutter/material.dart';

import '../../configs/constant.dart';
import 'components/body-form-address.dart';

class FormAddress extends StatelessWidget {
  static String routeName = '/formAddress';
  const FormAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Thêm địa chỉ giao hàng',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: const BodyFormAddress(),
    );
  }
}
