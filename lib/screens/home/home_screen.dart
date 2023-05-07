import 'package:ecommerce_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../configs/size_config.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(body: Body());
  }
}
