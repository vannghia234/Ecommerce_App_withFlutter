import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../controller/product_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    Logger().i(
        'GetX total Body homescreen  ${controller.listAllProduct.value.length}');
    return const SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.03,
            // ),
            // const HomeHeader(),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.03,
            // ),
            // const CardSale(),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.03,
            // ),
            // const Categories(),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.03,
            // ),
            // TitleRow(
            //   title: 'Tin tức',
            //   subTitle: 'Xem thêm',
            //   press: () {},
            // ),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.02,
            // ),
            // const SpecialCard(),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.03,
            // ),
            // TitleRow(
            //   title: 'Sản phẩm phổ biến',
            //   subTitle: 'Xem thêm',
            //   press: () {},
            // ),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.03,
            // ),
            // const PopularProduct(),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.05,
            // ),
            // TitleRow(
            //   title: 'Có thể bạn thích',
            //   subTitle: 'See More',
            //   press: () {},
            // ),
            // const ProductYourFavourite()
          ],
        ),
      ),
    ));
  }
}
