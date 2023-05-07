import 'package:flutter/material.dart';

import 'components/body.dart';

class PayHistoryScreen extends StatelessWidget {
  static String routeName = '/payHistory';
  const PayHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch sử mua hàng"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black,
            )),
      ),
      body: const Body(),
    );
  }
}
