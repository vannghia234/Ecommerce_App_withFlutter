import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/screens/splash/component/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
