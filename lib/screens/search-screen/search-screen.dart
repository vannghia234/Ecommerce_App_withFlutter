import 'package:ecommerce_app/configs/size_config.dart';
import 'package:ecommerce_app/screens/search-screen/components/body.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search-screeen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const Body(),
    );
  }
}
