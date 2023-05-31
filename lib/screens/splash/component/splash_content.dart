import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../configs/constant.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'HEALTHYCARE',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 2,
          ),
          Lottie.asset(
            image,
            height: 340,
            width: 300,
          )
        ],
      ),
    );
  }
}
