import 'package:ecommerce_app/screens/shipping-address/components/body-shipping-address.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  static String routeName = '/shippingAdress';
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Chọn địa chỉ giao hàng',
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
      body: const BodyShippingAdress(),
    );
  }
}
