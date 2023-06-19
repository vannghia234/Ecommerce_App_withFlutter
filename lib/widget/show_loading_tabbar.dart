import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future showLoadingAnimationTabbar(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Lottie.asset('assets/animations/loading.json',
                width: 140, height: 140)),
      );
    },
  );
}
