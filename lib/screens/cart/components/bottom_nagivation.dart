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
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(TextSpan(
                    text: "Total Payment: ",
                  )),
                  StreamBuilder<int>(
                    //future: returnTotal(),
                    builder: (context, snapshot) {
                      // setState(() {
                      //   total = total;
                      // });
                      if (snapshot.hasData) {
                        return Center(
                          child: Text(
                            total.toString(),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            total.toString(),
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
                width: 185.29,
                height: 50,
                child: DefaultButton(
                  text: "Thanh toán",
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<int> returnTotal() async {
  int totalPrice = total;
  return totalPrice;
}

// void _updateVariable(int newValue) {
//   total = newValue;
//   CartItem.add(newValue);
// }