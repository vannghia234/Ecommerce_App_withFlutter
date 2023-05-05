import 'package:flutter/material.dart';

import '../../../widget/default_button.dart';
import '../../cart/cart_screen.dart';

class bottomCart extends StatelessWidget {
  const bottomCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
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
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(TextSpan(
                    text: "Tổng thanh toán:",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black),
                  )),
                  Text.rich(TextSpan(
                    text: "$total",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black),
                  ))
                ],
              ),
              const SizedBox(
                width: 23.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 50,
                child: DefaultButton(
                  text: "Đặt hàng",
                  press: () {
                    // Navigator.pushAndRemoveUntil<dynamic>(
                    //     context,
                    //     MaterialPageRoute<dynamic>(
                    //       builder: (context) => const PayScreen(),
                    //     ),
                    //     (route) => true);
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
