import 'package:flutter/material.dart';

class PaypalSuccessScreen extends StatelessWidget {
  const PaypalSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Successful"),
      ),
      body: const Center(
        child: Text(
          "Thank you for your purchase!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
