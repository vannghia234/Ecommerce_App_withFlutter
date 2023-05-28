import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThanksForBuying extends StatelessWidget {
  const ThanksForBuying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 60,
            color: kPrimaryColor,
          ),
          const SizedBox(height: 20),
          const Text(
            'Thanks for buying!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Your order has been completed.',
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor, // Set the color here
            ),
            onPressed: () {
              //Get.put();
              // Navigate to home screen or any other screen as needed
              Get.toNamed(HomeScreen.routeName);
            },
            child: const Text('Continue Shopping'),
          ),
        ],
      ),
    );
  }
}
