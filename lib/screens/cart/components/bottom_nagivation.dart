import 'dart:async';

import 'package:ecommerce_app/screens/cart/components/product.dart';
import 'package:ecommerce_app/screens/pay_cart/pay_cart_screen.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';

import '../cart_screen.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({
    super.key,
  });

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  Stream<int> returnTotalPrice() async* {
    int totalPrice = 0;
    int sl = 0;
    for (int i = 0; i < chooseProduct.length; i++) {
      totalPrice += chooseProduct[i].quantity * chooseProduct[i].products.price;
    }
    sl = chooseProduct.length;
    setState(() {
      quantity = sl;
      total = totalPrice;
    });
    yield totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.9),
            )
          ]),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(TextSpan(
                    text: "Tổng thanh toán: ",
                  )),
                  StreamBuilder<int>(
                    stream: returnTotalPrice(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                          child: Text(
                            snapshot.data.toString(),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            snapshot.data.toString(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                width: 23.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 50,
                child: DefaultButton(
                  text: "Thanh toán ($quantity)",
                  press: () {
                    Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const PayCartScreen(),
                        ),
                        (route) => true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<int> returnTotal() async {
//   int totalPrice = total;
//   return totalPrice;
// }
