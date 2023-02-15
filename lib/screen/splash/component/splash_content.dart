import 'package:flutter/material.dart';

import '../../../constant.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          'TOKOTO',
          style: TextStyle(
              fontSize: 36, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        Text(text),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 265,
          width: 235,
        )
      ],
    );
  }
}
