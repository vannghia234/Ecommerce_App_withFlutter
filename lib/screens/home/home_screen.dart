import 'package:ecommerce_app/models/UserResponse.dart';
import 'package:ecommerce_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../api/products/fetch_api_service.dart';
import '../../configs/size_config.dart';
import '../../models/ProductListResponse.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ProductListResponse?> futureProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state nè');
    futureProduct = FetchApiService.instance.getAllProduct();
    // print(FetchApiService.instance.getRefreshToken());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(body: Body());
  }
}
