import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../cart_screen.dart';

class bottom_navigation_v1 extends StatefulWidget {
  const bottom_navigation_v1({super.key});

  @override
  State<bottom_navigation_v1> createState() => _bottom_navigation_v1State();
}

class _bottom_navigation_v1State extends State<bottom_navigation_v1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 116.44,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total Payment",
                ),
                StreamBuilder<int>(
                  //future: returnTotal(),
                  builder: (context, snapshot) {
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(62), // <-- Radius
                  ),
                ),
                onPressed: () {
                  // Api checkout
                },
                child: const Text(
                  "Thanh toán",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int> returnTotal() async {
  return total;
}
