import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/body.dart';
import 'components/bottom_nagivation.dart';

int total = 0;
int quantity = 0;

class TotalController extends GetxController {
  RxInt total = 0.obs;
  RxInt count = 0.obs;
  void chooseProduct(int price, int quantity) {
    total += price * quantity;
    count++;
  }

  void unchosenProduct(int price, int quantity) {
    total -= price * quantity;
    count--;
  }

  void incrementTotal(int price) {
    total += price;
  }

  void decreaseTotal(int price) {
    total -= price;
  }
}

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      body: const Body(),
      bottomNavigationBar: const bottom_navigation(),
    );
  }
}
