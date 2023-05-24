import 'package:ecommerce_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../api/products/fetch_api.dart';
import '../../configs/size_config.dart';
import '../../models/product_list_response.dart';

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
    futureProduct = FetchApiProductService.instance.getAllProduct();
    // ApiLogin.login('nghiatrong123', 'nghiadz123');
    // ApiRegister.register(
    //     fullname: 'vũ trọng nghia',
    //     email: 'vntsjsj@gmail.com',
    //     username: 'vtn34223',
    //     password: 'nghiadz123',
    //     phone: '01231241231');

    // print(FetchApiService.instance.getRefreshToken());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(body: Body());
  }
}
