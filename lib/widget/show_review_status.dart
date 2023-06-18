import 'dart:async';

import 'package:ecommerce_app/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ShowReviewStatus extends StatefulWidget {
  const ShowReviewStatus({super.key});

  @override
  State<ShowReviewStatus> createState() => _ShowReviewStatusState();
}

class _ShowReviewStatusState extends State<ShowReviewStatus> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () => Get.offAll(() => const RootApp()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
          child: SizedBox(
              height: 500,
              width: 500,
              child: Lottie.asset(
                'assets/animations/status_review.json',
              ))),
    );
  }
}
