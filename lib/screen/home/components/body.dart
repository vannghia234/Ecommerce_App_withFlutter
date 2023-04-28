import 'package:flutter/material.dart';

import 'homeheader.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            HomeHeader()
          ],
        ),
      ),
    ));
  }
}
