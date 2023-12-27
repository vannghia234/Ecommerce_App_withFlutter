import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/bottom_cart.dart';

class PayCartScreen extends StatelessWidget {
  static String routeName = '/cart-pay';
  const PayCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24.0,
              color: Colors.black,
            )),
      ),
      body: const Body(),
      bottomNavigationBar: bottomCart(),
    );
  }
}
