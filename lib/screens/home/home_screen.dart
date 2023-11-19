import 'package:ecommerce_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../configs/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(body: Body());
  }
}
