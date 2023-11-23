import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  static String routeName = '/paymentMethod';
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        centerTitle: true,
        title: const Text(
          "Hình thức thanh toán",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              "Hình thức thanh toán khả dụng",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
    );
  }
}
