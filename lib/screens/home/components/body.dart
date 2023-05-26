import 'package:ecommerce_app/screens/home/components/popular-product.dart';
import 'package:ecommerce_app/screens/home/components/product_your_favourite.dart';
import 'package:ecommerce_app/screens/home/components/special-card.dart';
import 'package:ecommerce_app/screens/home/components/title-row.dart';
import 'package:flutter/material.dart';

import '../../../configs/size_config.dart';
import 'cart-sale.dart';
import 'categories.dart';
import 'homeheader.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            const HomeHeader(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            const CardSale(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            const Categories(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            TitleRow(
              title: 'Tin tức',
              subTitle: 'Xem thêm',
              press: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const SpecialCard(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            TitleRow(
              title: 'Sản phẩm phổ biến',
              subTitle: 'Xem thêm',
              press: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const PopularProduct(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            TitleRow(
              title: 'Có thể bạn thích',
              subTitle: 'Xem thêm',
              press: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const ProductYourFavourite()
          ],
        ),
      ),
    ));
  }
}
